#!/usr/bin/env bash

LOG_FILE=$PWD/log.out

rm -f $LOG_FILE
## initialising logging on both console and file
exec 3>&1 1>>$LOG_FILE 2>&1

## This openmrs bash script helps extract details about 

## ensure params.json exists
if [ ! -f $PWD/params.json ]; then
    echo "Ensure $PWD/params.json exists!" | tee /dev/fd/3
    exit 1
fi

## extract values from a node, arguments; xml file, node, comma separated attributes whose values to extract, form_failed file path
extractNodeValues () {
  values=""
  IFS=',' read -r -a attributes <<< "$3"
  for a in "${attributes[@]}"
  do
    if grep -q $a $1 && grep -q $2 $1; then
      if [ "$values" != "" ]; then
        values="$values,"
      fi
      node=$(xmllint --xpath '//*/@'$a - <<< "$(find $1 -type f -print | xargs grep $2)")
      if [ $? -gt 0 ]; then
  	    ## some error happened, pass this file into failed category
  	    printf "\nEnsure $2:$a node in data/${1##*/} exist on separate lines in failed/${1##*/}" >> $4
  	    cp $1 $PWD/failed/${1##*/}
  	  fi
  	  values=$values$(cut -d '=' -f 2 <<< $node | sed -e 's/^"//' -e 's/"$//')
  	fi
  done
  echo $values
}

## get values replacing global properties. arguments; values text with gp
getValuesReplacingGlobalProperties () {
  finalValues=""
  if [[ "$1" == *"GlobalProperty:default_location"* ]]; then
    IFS=',' read -r -a values <<< "$1"
    for v in "${values[@]}"
    do
      if [ "$finalValues" != "" ]; then
        finalValues="$finalValues,"
      fi
      if [[ "$v" = "GlobalProperty:default_location"* ]]; then
        finalValues=$finalValues$(echo "SELECT GROUP_CONCAT(location_id) FROM location WHERE name = (select property_value from global_property where property = 'default_location')" | $MYSQL_CMD -u$MYSQL_USER $MYSQL_PASS_ENTRY $MYSQL_OPTS $MYSQL_DB -s)
      else
        finalValues=$finalValues$v
      fi
    done
    echo $finalValues
  else
    echo $1
  fi
}

## first argument; file, second argument; separator, third argument; wrapper
combineAllLinesFromFileIntoOneWithSeparator () {
  lines=""
  while IFS= read -r line
  do
    if [ "$line" != "" ]; then
      line="${line//$2/$3$2$3}"
      if [ "$lines" == "" ]; then
        lines="$3$line$3"
      else
        lines="$lines$2$3$line$3"
      fi
    fi
  done < "$1"
  ## echo or 'return' excluding first trailing character of separator
  echo "$lines"
}

## combine all objects into comma separated string, first argument; string to prepare, two; wrapper
prepareReadableDisplay () {
  IFS=',' read -r -a meta <<< "$1"
  meta=($(printf "%s\n" "${meta[@]}" | sort -u | tr '\n' ' '))
  metaIds=$(IFS=$','; echo "${meta[*]}")
  echo "$metaIds"
}

## extract expression values; arguments: first; file, second; expression prefix, third argument; separator, forth; toBeRemoved, fifth: wrapper
extractExpressionValues () {
  lines=""
  while IFS= read -r line
  do
  	## starts with expression prefix
  	
    if [[ "$line" == "$2"* ]]; then
      ## get value in between () within expression value
      value="${line//$2/}"
      value="${value//$4/}"
      if [ "$lines" == "" ]; then
        lines="$5$value$5"
      else
        lines="$lines$3$5$value$5"
      fi  
    fi
  done < "$1"
  ## echo or 'return' excluding first trailing character of separator
  echo "$lines"
}
 
## initialise data location
rm -r data;mkdir -p data
mkdir -p failed
  
for ((dbConnIndex=0; dbConnIndex<$(jq ".mysqlDbConnections | length" params.json); dbConnIndex++ ))
do
  eval MYSQL_CMD=$(jq -r ".mysqlDbConnections[$dbConnIndex].binaryLocation" params.json)
  eval MYSQL_USER=$(jq -r ".mysqlDbConnections[$dbConnIndex].username" params.json)
  eval MYSQL_OPTS=$(jq -r ".mysqlDbConnections[$dbConnIndex].options" params.json)
  eval MYSQL_DB=$(jq -r ".mysqlDbConnections[$dbConnIndex].database" params.json)
  eval MYSQL_PASS=$(jq -r ".mysqlDbConnections[$dbConnIndex].password" params.json)
  if [ "$MYSQL_PASS" != "" ]; then
    MYSQL_PASS_ENTRY="-p$MYSQL_PASS"
  fi
  dbConnCount=$(echo "$dbConnIndex + 1" | bc)
  
  ## locate where mysql exported cvs are rightly meant to be saved
  secureFileLocation=$(echo "SELECT @@secure_file_priv" | $MYSQL_CMD -u$MYSQL_USER $MYSQL_PASS_ENTRY $MYSQL_OPTS $MYSQL_DB | sed -n '2p')
  if [ "$secureFileLocation" == "NULL" ] || [ "$secureFileLocation" == "" ]; then
    secureFileLocation="$PWD/usage"
  fi

  form_concept_grouping_file="$PWD/data/$dbConnCount"_form_concept_grouping.txt
  form_concept_questions_file="$PWD/data/$dbConnCount"_form_concept_questions.txt
  form_concept_answers_file="$PWD/data/$dbConnCount"_form_concept_answers.txt
  form_programs_file="$PWD/data/$dbConnCount"_form_programs.txt
  form_expressions_file="$PWD/data/$dbConnCount"_form_expressions.txt
  form_locations_file="$PWD/data/$dbConnCount"_form_locations.txt
  form_roles_file="$PWD/data/$dbConnCount"_form_roles.txt
  form_defaults_file="$PWD/data/$dbConnCount"_form_defaults.txt
  ##contains form_file: advise to fix it
  form_failed="$PWD/failed/$dbConnCount"_form_failed.txt
  form_concept_used_csv="$secureFileLocation/$dbConnCount"_form_used_concepts.csv
  form_concept_not_used_csv="$secureFileLocation/$dbConnCount"_form_not_used_concepts.csv
  form_programs_used_csv="$secureFileLocation/$dbConnCount"_form_used_programs.csv
  form_programs_not_used_csv="$secureFileLocation/$dbConnCount"_form_not_used_programs.csv
  form_identifiers_used_csv="$secureFileLocation/$dbConnCount"_form_used_identifiers.csv
  form_identifiers_not_used_csv="$secureFileLocation/$dbConnCount"_form_not_used_identifiers.csv
  form_person_attributes_used_csv="$secureFileLocation/$dbConnCount"_form_used_person_attributes.csv
  form_person_attributes_not_used_csv="$secureFileLocation/$dbConnCount"_form_not_used_person_attributes.csv
  form_used_roles_csv="$secureFileLocation/$dbConnCount"_form_used_roles.csv
  form_not_used_roles_csv="$secureFileLocation/$dbConnCount"_form_not_used_roles.csv
  form_used_global_properties_csv="$secureFileLocation/$dbConnCount"_form_used_global_properties.csv
  form_locations_used_csv="$secureFileLocation/$dbConnCount"_form_used_locations.csv


  ## require mysql command or location, user and database
  if [ "$MYSQL_CMD" == "" ] || [ "$MYSQL_USER" == "" ] || [ "$MYSQL_DB" == "" ]; then
    printf "\nEnsure $PWD/params.json contains the right mysql database connection parameters" | tee /dev/fd/3
    exit 1
  fi
  
  
  printf '\n%s\n' ------------------------------------$dbConnCount:$MYSQL_DB------------------------------------ | tee /dev/fd/3
  
  
  rm -f $form_failed
  

  ## extract form uuids and loop through them
  printf "\nStarting to extract forms from the database\n" | tee /dev/fd/3
  $MYSQL_CMD -u$MYSQL_USER $MYSQL_PASS_ENTRY $MYSQL_OPTS $MYSQL_DB -s -N -e "SELECT uuid FROM htmlformentry_html_form" | while IFS= read -r uuid
  do
    ## simulate loading or progress bar
    echo -n "." | tee /dev/fd/3
    xmlData=`$MYSQL_CMD -u$MYSQL_USER $MYSQL_PASS_ENTRY $MYSQL_OPTS $MYSQL_DB -s -N -e "SELECT xml_data FROM htmlformentry_html_form WHERE uuid  = '$uuid'"`
    ## printf evaluates % character, let us replace it so it's not treated special
    xmlData="${xmlData//%/PCNT}"
    ## clean up the xml data file and save each form named after its form uuid
    xmlData=$(printf "$xmlData")
    ## save xmlData onto a respective form specific file replacing back %
    echo "${xmlData//PCNT/%}" > "$PWD/data/$dbConnCount"_form_"$uuid.xml"
  done
  printf "\nFinished extracting forms from the database\n" | tee /dev/fd/3


  ## extracting concepts from forms
  printf "\nStarting to extract metadata from forms\n" | tee /dev/fd/3
  for form_file in "$PWD/data/$dbConnCount"_form_*.xml "$PWD/failed/$dbConnCount"_form_*.xml
  do
    ## simulate loading or progress bar
    echo -n "." | tee /dev/fd/3
    ## extract concept question ids
    echo -n 'cat //*/@groupingConceptId' | xmllint --shell $form_file | awk -F\" 'NR % 2 == 0 { print $2 }' >> $form_concept_grouping_file
    ## extract concept question ids
    echo -n 'cat //*/@conceptId' | xmllint --shell $form_file | awk -F\" 'NR % 2 == 0 { print $2 }' >> $form_concept_questions_file
    ## extract concept answer ids
    echo -n 'cat //*/@answerConceptIds' | xmllint --shell $form_file | awk -F\" 'NR % 2 == 0 { print $2 }' >> $form_concept_answers_file
    ## extract program ids
    echo -n 'cat //*/@programId' | xmllint --shell $form_file | awk -F\" 'NR % 2 == 0 { print $2 }' >> $form_programs_file
    ## extract expressions
    echo -n 'cat //*/@expression' | xmllint --shell $form_file | awk -F\" 'NR % 2 == 0 { print $2 }' >> $form_expressions_file
    ## extract roles
    echo -n 'cat //*/@role' | xmllint --shell $form_file | awk -F\" 'NR % 2 == 0 { print $2 }' >> $form_roles_file
    ## extract roles
    echo -n 'cat //*/@default' | xmllint --shell $form_file | awk -F\" 'NR % 2 == 0 { print $2 }' >> $form_defaults_file
    ## extract encounterLocations
    echo $(getValuesReplacingGlobalProperties $(extractNodeValues $form_file 'encounterLocation' 'default,order' $form_failed)) >> $form_locations_file
  done
  printf "\nFinished extracting metadata from forms\n" | tee /dev/fd/3


  ## print separator horizontal line
  printf '\n%s\n' _________________________________________________________________________________ | tee /dev/fd/3


  ## generate unique used concept ids from all forms' questions and answers
  usedGroupingConceptIds="$(combineAllLinesFromFileIntoOneWithSeparator $form_concept_grouping_file ',' '"')"
  usedConceptIds="$usedGroupingConceptIds"
  usedQuestionConceptIds="$(combineAllLinesFromFileIntoOneWithSeparator $form_concept_questions_file ',' '"')"
  if [ "$usedQuestionConceptIds" != "" ] && [ "$usedConceptIds" != "" ]; then
    usedConceptIds="$usedConceptIds,$usedQuestionConceptIds"
  elif [ "$usedQuestionConceptIds" != "" ] && [ "$usedConceptIds" == "" ]; then
      usedConceptIds="$usedQuestionConceptIds"
  fi
  usedAnswerConceptIds="$(combineAllLinesFromFileIntoOneWithSeparator $form_concept_answers_file ',' '"')"
  if [ "$usedAnswerConceptIds" != "" ] && [ "$usedConceptIds" != "" ]; then
    usedConceptIds="$usedConceptIds,$usedAnswerConceptIds"
  elif [ "$usedAnswerConceptIds" != "" ] && [ "$usedConceptIds" == "" ]; then
      usedConceptIds="$usedAnswerConceptIds"
  fi
  ## generate unique used program ids from all forms
  usedProgramIds="$(combineAllLinesFromFileIntoOneWithSeparator $form_programs_file ',')"
  ## generate unique used identifiers
  usedIdentifierIds="$(extractExpressionValues $form_expressions_file 'patient.getPatientIdentifier(' ',' ')')"
  ## generate unique used person attributes
  usedPersonAttributes="$(extractExpressionValues $form_expressions_file 'patient.getAttribute(' ',' ')')"
  ## generate unique used roles from all forms
  usedRoles="$(combineAllLinesFromFileIntoOneWithSeparator $form_roles_file ',' '"')"
  ## generate unique used global properties from all forms
  usedGlobalProperties="$(extractExpressionValues $form_defaults_file 'GlobalProperty:' ',' '' '"')"
  ## generate unique locations from all forms
  usedLocations="$(combineAllLinesFromFileIntoOneWithSeparator $form_locations_file ',')"

  ## prepare usage output
  rm -rf usage;mkdir -p usage

  ## TODO support used metadata like concepts in the tree like within programs

  if [ "$usedConceptIds" != "" ]; then
    echo "SELECT 'UUID', 'ID' UNION ALL SELECT uuid,concept_id FROM concept WHERE concept_id IN (SELECT concept_id FROM concept WHERE (concept_id|uuid) IN ($usedConceptIds)) INTO OUTFILE '$form_concept_used_csv' FIELDS TERMINATED BY ','" | $MYSQL_CMD -u$MYSQL_USER $MYSQL_PASS_ENTRY $MYSQL_OPTS $MYSQL_DB
    printf "\nUsed Concepts in HTML Forms saved in# \n$form_concept_used_csv\n" | tee /dev/fd/3
    echo "SELECT 'UUID', 'ID' UNION ALL SELECT uuid,concept_id FROM concept WHERE concept_id NOT IN (SELECT concept_id FROM concept WHERE (concept_id|uuid) IN ($usedConceptIds)) INTO OUTFILE '$form_concept_not_used_csv' FIELDS TERMINATED BY ','" | $MYSQL_CMD -u$MYSQL_USER $MYSQL_PASS_ENTRY $MYSQL_OPTS $MYSQL_DB
    printf "\nNot Used Concepts in HTML Forms saved in# \n$form_concept_not_used_csv\n" | tee /dev/fd/3
    
    ## print separator horizontal line
    printf '\n%s\n' _________________________________________________________________________________ | tee /dev/fd/3
  fi
  
  if [ "$usedProgramIds" != "" ]; then
    echo "SELECT 'UUID', 'ID', 'NAME', 'DESCRIPTION' UNION ALL SELECT uuid,program_id,name,description FROM program WHERE program_id IN ($usedProgramIds) INTO OUTFILE '$form_programs_used_csv' FIELDS TERMINATED BY ','" | $MYSQL_CMD -u$MYSQL_USER $MYSQL_PASS_ENTRY $MYSQL_OPTS $MYSQL_DB
    printf "\nUsed Programs in HTML Forms saved in# \n$form_programs_used_csv\n" | tee /dev/fd/3
    echo "SELECT 'UUID', 'ID', 'NAME', 'DESCRIPTION' UNION ALL SELECT uuid,program_id,name,description FROM program WHERE program_id NOT IN ($usedProgramIds) INTO OUTFILE '$form_programs_not_used_csv' FIELDS TERMINATED BY ','" | $MYSQL_CMD -u$MYSQL_USER $MYSQL_PASS_ENTRY $MYSQL_OPTS $MYSQL_DB
    printf "\nNot Used Programs in HTML Forms saved in# \n$form_programs_not_used_csv\n" | tee /dev/fd/3

    ## print separator horizontal line
    printf '\n%s\n' _________________________________________________________________________________ | tee /dev/fd/3
  fi

  if [ "$usedIdentifierIds" != "" ]; then
    echo "SELECT 'UUID', 'ID', 'NAME', 'DESCRIPTION' UNION ALL SELECT uuid,patient_identifier_type_id,name,description FROM patient_identifier_type WHERE patient_identifier_type_id IN ($usedIdentifierIds) INTO OUTFILE '$form_identifiers_used_csv' FIELDS TERMINATED BY ','" | $MYSQL_CMD -u$MYSQL_USER $MYSQL_PASS_ENTRY $MYSQL_OPTS $MYSQL_DB
    printf "\nUsed Identifiers in HTML Forms saved in# \n$form_identifiers_used_csv\n" | tee /dev/fd/3
    echo "SELECT 'UUID', 'ID', 'NAME', 'DESCRIPTION' UNION ALL SELECT uuid,patient_identifier_type_id,name,description FROM patient_identifier_type WHERE patient_identifier_type_id NOT IN ($usedIdentifierIds) INTO OUTFILE '$form_identifiers_not_used_csv' FIELDS TERMINATED BY ','" | $MYSQL_CMD -u$MYSQL_USER $MYSQL_PASS_ENTRY $MYSQL_OPTS $MYSQL_DB
    printf "\nNot Used Identifiers in HTML Forms saved in# \n$form_identifiers_not_used_csv\n" | tee /dev/fd/3

    ## print separator horizontal line
    printf '\n%s\n' _________________________________________________________________________________ | tee /dev/fd/3
  fi
  
  if [ "$usedPersonAttributes" != "" ]; then
    echo "SELECT 'UUID', 'ID', 'NAME', 'DESCRIPTION' UNION ALL SELECT uuid,person_attribute_type_id,name,description FROM person_attribute_type WHERE person_attribute_type_id IN ($usedPersonAttributes) INTO OUTFILE '$form_person_attributes_used_csv' FIELDS TERMINATED BY ','" | $MYSQL_CMD -u$MYSQL_USER $MYSQL_PASS_ENTRY $MYSQL_OPTS $MYSQL_DB
    printf "\nUsed person attribute types in HTML Forms saved in# \n$form_person_attributes_used_csv\n" | tee /dev/fd/3
    echo "SELECT 'UUID', 'ID', 'NAME', 'DESCRIPTION' UNION ALL SELECT uuid,person_attribute_type_id,name,description FROM person_attribute_type WHERE person_attribute_type_id NOT IN ($usedPersonAttributes) INTO OUTFILE '$form_person_attributes_not_used_csv' FIELDS TERMINATED BY ','" | $MYSQL_CMD -u$MYSQL_USER $MYSQL_PASS_ENTRY $MYSQL_OPTS $MYSQL_DB
    printf "\nNot Used person attribute types in HTML Forms saved in# \n$form_person_attributes_not_used_csv\n" | tee /dev/fd/3

    ## print separator horizontal line
    printf '\n%s\n' _________________________________________________________________________________ | tee /dev/fd/3
  fi

  if [ "$usedRoles" != "" ]; then
    echo "SELECT 'UUID', 'ROLE', 'DESCRIPTION' UNION ALL SELECT uuid,role,description FROM role WHERE role IN ($usedRoles) INTO OUTFILE '$form_used_roles_csv' FIELDS TERMINATED BY ','" | $MYSQL_CMD -u$MYSQL_USER $MYSQL_PASS_ENTRY $MYSQL_OPTS $MYSQL_DB
    printf "\nUsed roles in HTML Forms saved in# \n$form_used_roles_csv\n" | tee /dev/fd/3
    echo "SELECT 'UUID', 'ROLE', 'DESCRIPTION' UNION ALL SELECT uuid,role,description FROM role WHERE role NOT IN ($usedRoles) INTO OUTFILE '$form_not_used_roles_csv' FIELDS TERMINATED BY ','" | $MYSQL_CMD -u$MYSQL_USER $MYSQL_PASS_ENTRY $MYSQL_OPTS $MYSQL_DB
    printf "\nNot Used roles in HTML Forms saved in# \n$form_not_used_roles_csv\n" | tee /dev/fd/3

    ## print separator horizontal line
    printf '\n%s\n' _________________________________________________________________________________ | tee /dev/fd/3
  fi
  
  if [ "$usedGlobalProperties" != "" ]; then
    ##generate unique used global properties from all forms
    echo "SELECT 'UUID', 'PROPERTY', 'VALUE', 'DESCRIPTION' UNION ALL SELECT uuid,property,property_value,description FROM global_property WHERE property IN ($usedGlobalProperties) INTO OUTFILE '$form_used_global_properties_csv' FIELDS TERMINATED BY ','" | $MYSQL_CMD -u$MYSQL_USER $MYSQL_PASS_ENTRY $MYSQL_OPTS $MYSQL_DB
    printf "\nUsed Global Properties in HTML Forms saved in# \n$form_used_global_properties_csv\n" | tee /dev/fd/3

    ## print separator horizontal line
    printf '\n%s\n' _________________________________________________________________________________ | tee /dev/fd/3
  fi

  if [ "$usedLocations" != "" ]; then
    ##generate unique used locations from all forms
    echo "SELECT 'UUID', 'ID', 'NAME', 'DESCRIPTION' UNION ALL SELECT uuid,location_id,name,description FROM location WHERE location_id IN ($usedLocations) INTO OUTFILE '$form_locations_used_csv' FIELDS TERMINATED BY ','" | $MYSQL_CMD -u$MYSQL_USER $MYSQL_PASS_ENTRY $MYSQL_OPTS $MYSQL_DB
    printf "\nUsed Locations in HTML Forms saved in# \n$form_locations_used_csv\n" | tee /dev/fd/3

    ## print separator horizontal line
    printf '\n%s\n' _________________________________________________________________________________ | tee /dev/fd/3
  fi
  
  ## ensure exports are in usage folder
  if [[ "$secureFileLocation" != "$PWD/usage" ]]; then
     printf "\nMoving all *_form_*.csv files from $secureFileLocation into $PWD/usage\n" | tee /dev/fd/3
    mv "$secureFileLocation/$dbConnCount"_form_*.csv "$PWD/usage"
  fi
  
  printf '\n%s\n' ------------------------------------$dbConnCount:$MYSQL_DB------------------------------------ | tee /dev/fd/3
  
done