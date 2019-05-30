#!/bin/bash

## This openmrs bash script helps extract details about 

MYSQL_CMD=$1
MYSQL_USER=$2
MYSQL_OPTS=$3
MYSQL_DB=$4
form_concept_grouping_file="data/form_concept_grouping.txt"
form_concept_questions_file="data/form_concept_questions.txt"
form_concept_answers_file="data/form_concept_answers.txt"
form_programs_file="data/form_programs.txt"
form_expressions_file="data/form_expressions.txt"
form_concept_used_csv="$PWD/usage/form_used_concepts.csv"
form_concept_not_used_csv="$PWD/usage/form_not_used_concepts.csv"
form_programs_used_csv="$PWD/usage/form_used_programs.csv"
form_programs_not_used_csv="$PWD/usage/form_not_used_programs.csv"
form_identifiers_used_csv="$PWD/usage/form_used_identifiers.csv"
form_identifiers_not_used_csv="$PWD/usage/form_not_used_identifiers.csv"
form_person_attributes_used_csv="$PWD/usage/form_used_person_attributes.csv"
form_person_attributes_not_used_csv="$PWD/usage/form_not_used_person_attributes.csv"


## require mysql command or location, user and database
if [ "$MYSQL_CMD" == "" ] || [ "$MYSQL_USER" == "" ] || [ "$MYSQL_OPTS" == "" ] || [ "$MYSQL_DB" == "" ]; then
  printf "\nUsage;./openmrsMetadataUsage.sh mysql_command_or_location openmrs_user mysql_opts openmrs_db. Replace any blank values with ''"
  printf "\nExample;./openmrsMetadataUsage.sh mysql openmrs_user '--socket=/tmp/omrs.sock --max_allowed_packet=96M' openmrs_db"
  exit 1
fi


## wait for mysql password if any
echo -n "Enter Mysql password": 
read -s MYSQL_PASS
echo
## initialise data location
rm -r data;mkdir data


## extract form uuids and loop through them
printf "\nStarting to extract forms from the database\n"
$MYSQL_CMD -u$MYSQL_USER -p$MYSQL_PASS $MYSQL_OPTS $MYSQL_DB -s -N -e "SELECT uuid FROM htmlformentry_html_form" | while IFS= read -r uuid
do
  ## simulate loading or progress bar
  echo -n "."
  xmlData=`$MYSQL_CMD -u$MYSQL_USER -p$MYSQL_PASS $MYSQL_OPTS $MYSQL_DB -s -N -e "SELECT xml_data FROM htmlformentry_html_form WHERE uuid  = '$uuid'"`
  ## printf evaluates % character, let us replace it so it's not treated special
  xmlData="${xmlData//%/PCNT}"
  ## clean up the xml data file and save each form named after its form uuid
  xmlData=$(printf "$xmlData")
  ## save xmlData onto a respective form specific file replacing back %
  echo "${xmlData//PCNT/%}" > "data/form_$uuid.xml"
done
printf "\nFinished extracting forms from the database\n"


## extracting concepts from forms
printf "\nStarting to extract metadata from forms\n"
for form_file in data/form_*.xml
do
  ## simulate loading or progress bar
  echo -n "."
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
done
printf "\nFinished extracting metadata from forms\n"


## first argument; file, second argument; separator
combineAllLinesFromFileIntoOneWithSeparator () {
  lines=""
  while IFS= read -r line
  do
    if [ "$line" != "" ]; then
      lines="$lines$2$line"
    fi
  done < "$1"
  ## echo or 'return' excluding first trailing character of separator
  echo "${lines#?}"
}

## combine all ids into comma separated string
prepareReadableDisplay () {
  IFS=',' read -r -a metadata <<< "$1"
  metadata=($(printf "%s\n" "${metadata[@]}" | sort -u | tr '\n' ' '))
  metadataIds=$(IFS=$','; echo "${metadata[*]}")
  echo "$metadataIds"
}

## extract expression values; first argument;file, second argument; expression prefix, third argument; separator, forth; toBeRemoved
extractExpressionValues () {
  lines=""
  while IFS= read -r line
  do
  	## starts with expression prefix
    if [[ "$line" = "$2"* ]]; then
      ## get value in between () within expression value
      value="${line//$2/}"
      value="${value//$4/}"
      lines="$lines$3$value"
    fi
  done < "$1"
  ## echo or 'return' excluding first trailing character of separator
  echo "${lines#?}"
}

## generate unique used concept ids from all forms' questions and answers
usedConceptIds="$(prepareReadableDisplay $(combineAllLinesFromFileIntoOneWithSeparator $form_concept_grouping_file ','),$(combineAllLinesFromFileIntoOneWithSeparator $form_concept_questions_file ','),$(combineAllLinesFromFileIntoOneWithSeparator $form_concept_answers_file ','))"
IFS=',' read -r -a usedConceptIdsArr <<< "$usedConceptIds"
## generate unique used program ids from all forms
usedProgramIds="$(prepareReadableDisplay $(combineAllLinesFromFileIntoOneWithSeparator $form_programs_file ','))"
IFS=',' read -r -a usedProgramIdsArr <<< "$usedProgramIds"
## generate unique used identifiers
usedIdentifierIds="$(prepareReadableDisplay $(extractExpressionValues $form_expressions_file 'patient.getPatientIdentifier(' ',' ')'))"
IFS=',' read -r -a usedIdentifierIdsArr <<< "$usedIdentifierIds"
## generate unique used person attributes
usedPersonAttributes="$(prepareReadableDisplay $(extractExpressionValues $form_expressions_file 'patient.getAttribute(' ',' ')'))"
IFS=',' read -r -a usedPersonAttributesArr <<< "$usedPersonAttributes"


## prepare usage output
rm -r usage;mkdir usage

## TODO support used metadata like concepts in the tree like within programs

## generate unique non used concept ids from all form's questions and answers
usedConceptsIdsPut=$(echo "SELECT 'UUID', 'ID' UNION ALL SELECT uuid,concept_id FROM concept WHERE concept_id IN ($usedConceptIds) INTO OUTFILE '$form_concept_used_csv' FIELDS TERMINATED BY ','" | $MYSQL_CMD -u$MYSQL_USER -p$MYSQL_PASS $MYSQL_OPTS $MYSQL_DB)
printf "\n${#usedConceptIdsArr[@]} Used Concepts in HTML Forms saved in# \n$form_concept_used_csv\n"
notUsedConceptsIdsPut=$(echo "SELECT 'UUID', 'ID' UNION ALL SELECT uuid,concept_id FROM concept WHERE concept_id NOT IN ($usedConceptIds) INTO OUTFILE '$form_concept_not_used_csv' FIELDS TERMINATED BY ','" | $MYSQL_CMD -u$MYSQL_USER -p$MYSQL_PASS $MYSQL_OPTS $MYSQL_DB)
printf "\nNot Used Concepts in HTML Forms saved in# \n$form_concept_not_used_csv\n"

## print separator horizontal line
printf '\n%s\n' _________________________________________________________________________________

##generate unique non used program ids from all forms
echo "SELECT 'UUID', 'ID', 'NAME', 'DESCRIPTION' UNION ALL SELECT uuid,program_id,name,description FROM program WHERE program_id IN ($usedProgramIds) INTO OUTFILE '$form_programs_used_csv' FIELDS TERMINATED BY ','" | $MYSQL_CMD -u$MYSQL_USER -p$MYSQL_PASS $MYSQL_OPTS $MYSQL_DB
printf "\n${#usedProgramIdsArr[@]} Used Programs in HTML Forms saved in# \n$form_programs_used_csv\n"
echo "SELECT 'UUID', 'ID', 'NAME', 'DESCRIPTION' UNION ALL SELECT uuid,program_id,name,description FROM program WHERE program_id NOT IN ($usedProgramIds) INTO OUTFILE '$form_programs_not_used_csv' FIELDS TERMINATED BY ','" | $MYSQL_CMD -u$MYSQL_USER -p$MYSQL_PASS $MYSQL_OPTS $MYSQL_DB
printf "\nNot Used Programs in HTML Forms saved in# \n$form_programs_not_used_csv\n"

## print separator horizontal line
printf '\n%s\n' _________________________________________________________________________________

##generate unique non used identifiers from all forms
echo "SELECT 'UUID', 'ID', 'NAME', 'DESCRIPTION' UNION ALL SELECT uuid,patient_identifier_type_id,name,description FROM patient_identifier_type WHERE patient_identifier_type_id IN ($usedIdentifierIds) INTO OUTFILE '$form_identifiers_used_csv' FIELDS TERMINATED BY ','" | $MYSQL_CMD -u$MYSQL_USER -p$MYSQL_PASS $MYSQL_OPTS $MYSQL_DB
printf "\n${#usedIdentifierIdsArr[@]} Used Identifiers in HTML Forms saved in# \n$form_identifiers_used_csv\n"
echo "SELECT 'UUID', 'ID', 'NAME', 'DESCRIPTION' UNION ALL SELECT uuid,patient_identifier_type_id,name,description FROM patient_identifier_type WHERE patient_identifier_type_id NOT IN ($usedIdentifierIds) INTO OUTFILE '$form_identifiers_not_used_csv' FIELDS TERMINATED BY ','" | $MYSQL_CMD -u$MYSQL_USER -p$MYSQL_PASS $MYSQL_OPTS $MYSQL_DB
printf "\nNot Used Identifiers in HTML Forms saved in# \n$form_identifiers_not_used_csv\n"

## print separator horizontal line
printf '\n%s\n' _________________________________________________________________________________

##generate unique non used person attribute types from all forms
echo "SELECT 'UUID', 'ID', 'NAME', 'DESCRIPTION' UNION ALL SELECT uuid,person_attribute_type_id,name,description FROM person_attribute_type WHERE person_attribute_type_id IN ($usedPersonAttributes) INTO OUTFILE '$form_person_attributes_used_csv' FIELDS TERMINATED BY ','" | $MYSQL_CMD -u$MYSQL_USER -p$MYSQL_PASS $MYSQL_OPTS $MYSQL_DB
printf "\n${#usedPersonAttributesArr[@]} Used person attribute types in HTML Forms saved in# \n$form_person_attributes_used_csv\n"
echo "SELECT 'UUID', 'ID', 'NAME', 'DESCRIPTION' UNION ALL SELECT uuid,person_attribute_type_id,name,description FROM person_attribute_type WHERE person_attribute_type_id NOT IN ($usedPersonAttributes) INTO OUTFILE '$form_person_attributes_not_used_csv' FIELDS TERMINATED BY ','" | $MYSQL_CMD -u$MYSQL_USER -p$MYSQL_PASS $MYSQL_OPTS $MYSQL_DB
printf "\nNot Used person attribute types in HTML Forms saved in# \n$form_person_attributes_not_used_csv\n"
