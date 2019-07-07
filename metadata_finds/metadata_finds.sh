#!/bin/bash
#This  script runs  in all pattners databases in order  to find nonconformity patient 
# and  displays in in *.csv  file


#Collecting MySQL credential
echo "Collecting MySQL credentials........................................................................"
echo "MySQL User: "
read mysql_user
echo "MySQL Password: "
read -s mysql_passwd
echo "MySQL IP: "
read host
#host="localhost"
#creating the folder "/epts_metadata_finds"  in home user  directory if  it  does not exist
echo "Creating the  'epts_metadata_finds' folder  in home user directory if  it  does not exist........"
if [ ! -d "~/epts_metadata_finds" ];
	then 
		mkdir ~/epts_metadata_finds
fi

#wipe all data in the folder before running
echo "wiping all data in the folder before running..."
rm  -rf ~/epts_metadata_finds/*


echo "Choosing the running  approach..."
echo "Do you  want to  perform this  script in all databases? [y/n] (lower case please)"
read all_db_anserwer

#declaring an empty array to store the databases names 
declare -a  db_list=()


if [ $all_db_anserwer == "y" ]
	then
                #write all the out put to a file for show database
    		mysql -u $mysql_user -p$mysql_passwd -h $host -e "show databases;" >  temp_file.txt

                #readarray db_list   < temp_file.txt
		
                #start putting all the data to an array
                idx=0
                file="temp_file.txt"
                while IFS= read -r line;
                do
                        echo "Do you  want to  add $line database to the investigation? [y/n] (lower case please)"
                        read sim </dev/tty
                        if [[ $sim == "y" ]];
                                then
                                        echo "Adding..."
                                        db_list[idx]=$line;
                                        idx=$((idx+1)) 
                        fi
                done < "$file"

                #unset all default databases from array
		i_schm="information_schema"
                p_schm="performance_schema"
		msql="mysql"
		daBase="Database"
                sys="sys"
                new_schema="new_schema"

		index=0
		for i in ${db_list[@]}; do
                        if [ "$i" = "$i_schm" ] || [ "$i" = "$p_schm" ] || [ "$i" = "$msql" ] || [ "$i" = "$daBase" ] || [ "$i" = "$sys" ] || [ "$i" = "$new_schema" ]; then
                                unset db_list[$index]            
                        fi 
                        let index++
        done

elif [ $all_db_anserwer == "n" ];
	then
    		#Loading  the databases names
   		echo  "How mamy data bases you want to  identify the metadata?"
    		read db_num

    		index=1
    
    		while [ $index -le $db_num ]
    		do
   			echo "Type the database name$index: "
    			read database
    			db_list[index]=$database;
    			index=$((index+1)) 
    		done

else
    	echo "Please type y or n"
	exit 1
fi    
echo "Here is the list I will be working on ${db_list[@]}"
echo ""
echo "Do you which to continue... [y/n] (lower case please)"
read continuar

if [ $continuar == "n" ]
        then
                exit 1
fi
declare -A queries

####  the bellow  queries  will used to run in mentioned partners databases  ####
#--Get List of all programs
queries[0,0]="SELECT program_id,name,retired program_retired,uuid FROM program ORDER BY program_id;"
queries[0,1]="all programs"

#--Get all the workflow of the programs
queries[1,0]="SELECT p.program_workflow_id,p.program_id,p.retired program_workflow_retired, p.concept_id,c.name,p.uuid program_workflow_uuid,c.uuid concept_uuid FROM program_workflow p INNER JOIN concept_name c ON p.concept_id=c.concept_id ORDER BY program_workflow_id;"
queries[1,1]="all workflow"

#--Get all the workflow states
queries[2,0]="SELECT p.program_workflow_id,p.program_Workflow_state_id,p.retired program_workflow_state_retired, p.concept_id, c.name, p.uuid program_workflow_state_uuid FROM program_workflow_state p INNER JOIN concept_name c ON p.concept_id=c.concept_id ORDER BY program_workflow_id;"
queries[2,1]="all workflow states"

#--Get all the person attribute types
queries[3,0]="SELECT person_attribute_type_id, name,retired,uuid FROM  person_attribute_type ORDER BY person_attribute_type_id;"
queries[3,1]="all person attributes"

#--Get all the encounter type
queries[4,0]="SELECT encounter_type_id, name, retired,uuid FROM encounter_type ORDER BY encounter_type_id;"
queries[4,1]="all encounter types"

#--Get all the forms
queries[5,0]="SELECT form_id, name,retired,uuid FROM form;"
queries[5,1]="all forms"

#--Get all patient identifier type
queries[6,0]="SELECT patient_identifier_type_id, name,retired,uuid FROM  patient_identifier_type;"
queries[6,1]="all identifier types"

#--Get all order types
queries[7,0]="SELECT order_type_id,name,retired,uuid FROM order_type;"
queries[7,1]="all order types"

#--Get all user roles
queries[8,0]="SELECT role,uuid FROM role ORDER BY role;"
queries[8,1]="all roles"

#--Get all visit types
queries[9,0]="SELECT visit_type_id,name,retired,uuid FROM visit_type ORDER BY visit_type_id;"
queries[9,1]="all visit types"

#--Get all forms not being used in any encounter
queries[10,0]="SELECT form_id,name,retired,uuid FROM form WHERE form_id NOT IN (SELECT DISTINCT form_id FROM encounter);"
queries[10,1]="all forms not in encounter"

query=""
#change this funtion to use a loop by creating the queries as arrays.
#connecting to  MySQL instance
echo "Connecting  to your mysql instance................................................"
for  db in "${db_list[@]}"
	do
        echo "   " 
        echo "##################################  perfoming in $db database............................................" 
            mkdir ~/epts_metadata_finds/"$db"

        for((i=0;i<=11;i++));
        do
             echo "${queries[$i,1]}"
             mysql -u $mysql_user -p$mysql_passwd -h $host -D$db -e "${queries[$i,0]}" >  ~/epts_metadata_finds/"$db"/"$db_${queries[$i,1]}.csv"
        done 
        
	echo "concluded in $db...................................................."
            
done

echo "   "
echo "Search in Data Base(s) completed ........................................  "
echo "..........................."
echo ".................................."
echo "........................................"
echo "............................................."
echo "   "

echo "The files are located in 'epts_metadata_finds' in your home directory "
echo "Please copy all the folder and send to Jembi..."

