#!/bin/bash

MYSQL_CMD=$1
MYSQL_USER=$2
MYSQL_OPTS=$3
MYSQL_DB=$4
form_concept_questions_file="data/form_concept_questions.txt"
form_concept_answers_file="data/form_concept_answers.txt"
form_programs_file="data/form_programs.txt"


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
  printf "$xmlData" > "data/form_$uuid.xml"
  ## replace back %
  sed -n -e 's/PCNT/%/g' "data/form_$uuid.xml"
done
printf "\nFinished extracting forms from the database\n"


## extracting concepts from forms
printf "\nStarting to extract metadata from forms\n"
for form_file in data/form_*.xml
do
  ## simulate loading or progress bar
  echo -n "."
  ## extract concept question ids
  echo -n 'cat //*/@conceptId' | xmllint --shell $form_file | awk -F\" 'NR % 2 == 0 { print $2 }' >> $form_concept_questions_file
  ## extract concept answer ids
  echo -n 'cat //*/@answerConceptIds' | xmllint --shell $form_file | awk -F\" 'NR % 2 == 0 { print $2 }' >> $form_concept_answers_file
  ## extract program ids
  echo -n 'cat //*/@programId' | xmllint --shell $form_file | awk -F\" 'NR % 2 == 0 { print $2 }' >> $form_programs_file
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


## generate unique used concept ids from all forms' questions and answers
usedConceptsIds="$(prepareReadableDisplay $(combineAllLinesFromFileIntoOneWithSeparator $form_concept_questions_file ','),$(combineAllLinesFromFileIntoOneWithSeparator $form_concept_answers_file ','))"
## generate unique program ids from all forms
usedProgramIds="$(prepareReadableDisplay $(combineAllLinesFromFileIntoOneWithSeparator $form_programs_file ','))"


## clean entire console to only show metadata usage
clear && printf '\e[3J'

## generate unique non used concept ids from all form's questions and answers
printf "\n\nConcept Ids used in HTML Forms# \n$usedConceptsIds\n"
nonUsedConceptsIds=$(echo "SELECT concept_id FROM concept WHERE concept_id NOT IN ($usedConceptsIds)" | $MYSQL_CMD -u$MYSQL_USER -p$MYSQL_PASS $MYSQL_OPTS $MYSQL_DB -s -N)
nonUsedConceptsIds=`echo "$nonUsedConceptsIds" | tr '\n' ','`
## exclude last trailing ',' character and show non used conceptIds
nonUsedConceptsIds="${nonUsedConceptsIds%?}"
printf "\nConcept Ids Not used in HTML Forms# \n$nonUsedConceptsIds\n"

## print separator horizontal line
printf '\n\n%s\n\n' _____________________________________________________________________________________________________

##generate unique non used program ids from all forms
printf "\n\nProgram Ids used in HTML Forms# \n$usedProgramIds\n"
nonUsedProgramIds=$(echo "SELECT program_id FROM program WHERE program_id NOT IN ($usedProgramIds)" | $MYSQL_CMD -u$MYSQL_USER -p$MYSQL_PASS $MYSQL_OPTS $MYSQL_DB -s -N)
nonUsedProgramIds=`echo "$nonUsedProgramIds" | tr '\n' ','`
## exclude last trailing ',' character and show non used programIds
nonUsedProgramIds="${nonUsedProgramIds%?}"
printf "\nProgram Ids Not used in HTML Forms# \n$nonUsedProgramIds\n"

