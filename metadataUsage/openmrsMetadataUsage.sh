#!/bin/bash

MYSQL_CMD=$1
MYSQL_USER=$2
MYSQL_OPTS=$3
MYSQL_DB=$4
form_concept_questions_file="data/form_concept_questions.txt"
form_concept_answers_file="data/form_concept_answers.txt"


## require mysql command or location, user and database
if [ "$MYSQL_CMD" == "" ] || [ "$MYSQL_USER" == "" ] || [ "$MYSQL_OPTS" == "" ] || [ "$MYSQL_DB" == "" ]; then
  printf "\nUsage; mysql_command openmrs_user mysql_opts openmrs_db. Replace any blank values with ''"
  printf "\nExample; mysql openmrs_user '--socket=/tmp/omrs.sock --max_allowed_packet=96M' openmrs_db"
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
printf "\nStarting to extract concepts from forms\n"
for form_file in data/form_*.xml
do
  echo -n "."
  ## extract concept question ids
  echo -n 'cat //*/@conceptId' | xmllint --shell $form_file | awk -F\" 'NR % 2 == 0 { print $2 }' >> $form_concept_questions_file
  ## extract concept answer ids
  echo -n 'cat //*/@answerConceptIds' | xmllint --shell $form_file | awk -F\" 'NR % 2 == 0 { print $2 }' >> $form_concept_answers_file
done
printf "\nFinished extracting concepts from forms\n"


## first argument; file, second argument; separator
combineAllLinesFromFileIntoOneWithSeparator () {
  lines=""
  while IFS= read -r line
  do
    if [ "$line" != "" ] && [ "$line" != "concept_id" ]; then
      lines="$lines$2$line"
    fi
  done < "$1"
  ## echo or 'return' excluding first trailing character of separator
  echo "${lines#?}"
}


## generate unique used concept ids from all form's questions and answers
IFS=',' read -r -a concepts <<< "$(combineAllLinesFromFileIntoOneWithSeparator $form_concept_questions_file ','),$(combineAllLinesFromFileIntoOneWithSeparator $form_concept_answers_file ',')"
concepts=($(printf "%s\n" "${concepts[@]}" | sort -u | tr '\n' ' '))
usedConceptsIds=$(IFS=$','; echo "${concepts[*]}")


## generate unique non used concept ids from all form's questions and answers
printf "\n\nConcept Ids used in HTML Forms# \n$usedConceptsIds\n"
nonUsedConceptsIds=$(echo "SELECT concept_id FROM concept WHERE concept_id NOT IN ($usedConceptsIds)" | $MYSQL_CMD -u$MYSQL_USER -p$MYSQL_PASS $MYSQL_OPTS $MYSQL_DB -s -N)
nonUsedConceptsIds=`echo "$nonUsedConceptsIds" | tr '\n' ','`

## exclude last trailing ',' character
nonUsedConceptsIds="${nonUsedConceptsIds%?}"
printf "\n\nConcept Ids Not used in HTML Forms# \n$nonUsedConceptsIds\n"
