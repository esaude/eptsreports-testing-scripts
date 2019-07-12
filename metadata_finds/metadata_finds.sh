#!/bin/bash
#This  script runs  in all pattners databases in order  to find all metadata 
#and  displays in in *.csv  file


#Collecting MySQL credential
echo "Collecting MySQL credentials........................................................................"
echo "MySQL User: "
read mysql_user
echo "MySQL Password: "
read -s mysql_passwd
echo "MySQL IP: "
read host
#host="localhost"

# validate the MySQL Credentials
until mysql -u $mysql_user -p$mysql_passwd -h $host -e ";" ; do
        echo "Can't connect to MySQL, please retry..."
        echo "MySQL User: "
        read mysql_user
        echo "MySQL Password: "
        read -s mysql_passwd
        echo "MySQL IP: "
        read host
done

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
                        echo "Do you  want to  add '$line' database to the investigation? [y/n] (lower case please)"
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
   		echo  "How many databases you want to scan to identify the metadata?"
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
echo "Here is the list I will be working on: [${db_list[@]}]"
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
queries[0,0]="SELECT program_id,name,retired program_retired,uuid FROM program ORDER BY program_id"
queries[0,1]="all-programs"

#--Get all the workflow of the programs
queries[1,0]="SELECT p.program_workflow_id,p.program_id,p.retired program_workflow_retired, p.concept_id,c.name,p.uuid program_workflow_uuid,c.uuid concept_uuid FROM program_workflow p INNER JOIN concept_name c ON p.concept_id=c.concept_id ORDER BY program_workflow_id"
queries[1,1]="all-workflow"

#--Get all the workflow states
queries[2,0]="SELECT p.program_workflow_id,p.program_Workflow_state_id,p.retired program_workflow_state_retired, p.concept_id, c.name, p.uuid program_workflow_state_uuid FROM program_workflow_state p INNER JOIN concept_name c ON p.concept_id=c.concept_id ORDER BY program_workflow_id"
queries[2,1]="all-workflow-states"

#--Get all the person attribute types
queries[3,0]="SELECT person_attribute_type_id, name,retired,retire_reason,date_retired,uuid FROM  person_attribute_type ORDER BY person_attribute_type_id"
queries[3,1]="all-person-attributes"

#--Get all the encounter type
queries[4,0]="SELECT encounter_type_id, name, retired,retire_reason,date_retired,uuid FROM encounter_type ORDER BY encounter_type_id"
queries[4,1]="all-encounter-types"

#--Get all the forms
queries[5,0]="SELECT form_id,name,description,encounter_type,retired,retired_reason,date_retired,uuid FROM form"
queries[5,1]="all-forms"

#--Get all patient identifier type
queries[6,0]="SELECT patient_identifier_type_id, name,required,retired,retire_reason,date_retired,uuid FROM  patient_identifier_type"
queries[6,1]="all-identifier-types"

#--Get all order types
queries[7,0]="SELECT order_type_id,name,retired,retire_reason,date_retired,uuid FROM order_type"
queries[7,1]="all-order-types"

#--Get all user roles
queries[8,0]="SELECT role,uuid FROM role ORDER BY role"
queries[8,1]="all-roles"

#--Get all visit types
queries[9,0]="SELECT visit_type_id,name,retired,retire_reason,date_retired,uuid FROM visit_type ORDER BY visit_type_id"
queries[9,1]="all-visit-types"

#--Get all forms not being used in any encounter
queries[10,0]="SELECT form_id,name,retired,retired_reason,date_retired,uuid FROM form WHERE form_id NOT IN (SELECT DISTINCT form_id FROM encounter)"
queries[10,1]="all-forms-not-in-encounter"

#--Get all concepts
queries[11,0]="SELECT c.concept_id,cn.name,cn.concept_name_type,c.retired,c.retired_by,c.date_retired,c.retire_reason,c.uuid FROM concept c INNER JOIN concept_name cn on cn.concept_id=c.concept_id ORDER BY c.concept_id"
queries[11,1]="all-concepts"

#--Get all relationship types
queries[12,0]="SELECT relationship_type_id,a_is_to_b,b_is_to_a,description,retired,retired_by,date_retired,retire_reason,uuid FROM relationship_type ORDER BY relationship_type_id"
queries[12,1]="all-relationship-types"

#Get Mysql files writing directory
#Files will be written in this directory then copied to ~/epts_metadata_finds
mysql -u $mysql_user -p$mysql_passwd -h $host -e "SHOW VARIABLES LIKE 'secure_file_priv';" >  temp.txt
file="temp.txt"
i=1
while IFS= read -r line;
do        
        if [[ $i == 0 ]];
        then
                echo "Adding mysql path..."
                array=($line)  
                mysqlPath=${array[1]}                                      
                echo "Mysql file path ${array[1]}"
        fi
        let i--
done < "$file"

#Remove all the content of mysql file path before start creating new files
rm -rf $mysqlPath*
#change this funtion to use a loop by creating the queries as arrays.
#connecting to  MySQL instance
echo "Connecting  to your mysql instance................................................"
for  db in "${db_list[@]}"
	do
        echo "   " 
        echo "##################################  perfoming in $db database............................................" 
            #mkdir ~/epts_metadata_finds/"$db"
            path=$mysqlPath"$db"
            mkdir $path
            #Give the ownership to mysql cause if not will not be able to right in the folder
            chown -R mysql:mysql $path

        for((i=0;i<=12;i++));
        do
             echo "Processing...${queries[$i,1]}"
             sql="${queries[$i,0]} INTO OUTFILE '$path/$db_${queries[$i,1]}.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n';"
        #      echo " Here is the query: $sql" ## for debugging
             mysql -u $mysql_user -p$mysql_passwd -h $host -D$db -e "$sql"
        done 
        
	echo "concluded in $db...................................................."
            
done

#moving now all the files to ~/epts_metadata_finds
cp -v -r $mysqlPath* ~/epts_metadata_finds/
ls ~/epts_metadata_finds/
echo "   "
echo "Search in Data Base(s) completed ........................................  "
echo "..........................."
echo ".................................."
echo "........................................"
echo "............................................."
echo "   "

echo "The files are located in '~/epts_metadata_finds' in your home directory "
echo "Please copy all the folder and send to Jembi..."


