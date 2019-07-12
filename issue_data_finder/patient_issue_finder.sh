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

#creating the folder "/epts_issue_data_finder"  in home user  directory if  it  does not exist
echo "Creating the  'epts_issue_data_finder' folder  in home user directory if  it  does not exist........"
if [ ! -d "~/epts_issue_data_finder" ];
	then 
		mkdir ~/epts_issue_data_finder
fi

#wipe all data in the folder before running
rm  -rf ~/epts_issue_data_finder/*


#choosing the running  approach
echo "Do you  want to  perform this  script in all databases? [y/n] (lower case please)"
read all_db_anserwer

#declaring an empty array to store the databases names 
declare -a  db_list=()


if [ $all_db_anserwer == "y" ]
	then
                #write all the out put to a file for show database
    		mysql -u $mysql_user -p$mysql_passwd -h $host -e "show databases;" >  temp_file.txt

                #readarray db_list   <  ~/epts_issue_data_finder/temp_file.txt
		
                #start putting all the data to an array
                idx=0
                input="temp_file.txt"
                while IFS= read -r line
                do
                
                        db_list[idx]=$line;
                        idx=$((idx+1)) 

                done < "$input"

                #unset all default databases from array
		i_schm="information_schema"
                p_schm="performance_schema"
		msql="mysql"
		daBase="Database"
		index=0
		for i in ${db_list[@]}; do
                        if [ "$i" = "$i_schm" ] || [ "$i" = "$p_schm" ] || [ "$i" = "$msql" ] || [ "$i" = "$daBase" ]; then
                                unset db_list[$index]            
                        fi 
            let index++
        done

elif [ $all_db_anserwer == "n" ];
	then
    		#Loading  the databases names
   		echo  "How mamy data bases you want to  identify patient's  issues?"
    		read db_num

    		index=1
    
    		while [ $index -le $db_num ]
    		do
   			echo "Type the database name:"
    			read database
    			db_list[index]=$database;
    			index=$((index+1)) 
    		done

else
    	echo "Please type y or n"
	exit 1
fi    
echo ""
echo "list of  data bases $db_list"
echo ""
####  the bellow  queries  will used to run in mentioned partners databases  ####
#--Get enrolled patients in any program but have null date of enrollment
query_1=" select p.*  from  patient_program pp inner  join patient p on pp.patient_id=p.patient_id where  pp.date_enrolled is null; "
#--Get enrolled patients in program 2 but NOT active(voided=1)
query_2="select p.*  from  patient_program pp inner join patient p on pp.patient_id=p.patient_id inner join program prg on pp.program_id=prg.program_id  where pp.date_enrolled is null and prg.program_id=2; "
#--Get enrolled patients in program 6 and 8 not anywhere in 1 or 2 nether do they have encounter types 5 or 7
query_3="select pa.*  from patient_program pp inner  join patient pa  on pa.patient_id=pp.patient_id inner  join encounter enc on enc.patient_id=pa.patient_id inner join  encounter_type enc_type on enc_type.encounter_type_id=enc.encounter_type where   ((pp.program_id =6 or  pp.program_id=8) and pp.program_id not in (1,2) ) 
and  (enc.encounter_type=5 or enc.encounter_type=7);"
#--Get enrolled patients in program 2 but location_id is 219 which is different from 208 we know
query_4="select  pa.*  from patient_program pp inner join patient pa on pa.patient_id=pp.patient_id where pp.location_id=219  and pp.program_id=2;"
#--Get enrolled patients ii program 1 and 2 but all of them voided=1
query_5="select pa.*   from patient_program pp inner join  patient pa on pa.patient_id=pp.patient_id where  (pp.program_id=1 or pp.program_id=2) and pa.voided=1;"
#-- Get enrolled patients in 1 but NOT active voided=1
query_6="select pa.* from patient_program pp inner  join patient pa on pa.patient_id=pp.patient_id where  pp.program_id=1  and pa.voided=1;"
#--Get enrolled patients in program 2 but location_id is 238 which is different from 208 we know
query_7="select  pa.*  from patient_program pp inner join patient pa on pa.patient_id=pp.patient_id where pp.location_id=238  and pp.program_id=2;"
#--Get enrolled patients in program 2 but location_id is NULL which is different from 208 we know
query_8="select  pa.* from patient_program pp inner join patient pa on pa.patient_id=pp.patient_id where pp.location_id is null  and pp.program_id=2;"
#--Get all pregnant males patients
query_9="select pa.*  from obs obs inner join encounter enc on  obs.encounter_id=enc.encounter_id inner join patient pa on  pa.patient_id=enc.patient_id inner join  person prs on  prs.person_id=pa.patient_id where prs.gender='M' and  obs.concept_id in (1982,5624);"
#--patients with death date but still active  in program
query_10="select pa.* ,prs.death_date  from patient_program pp inner join patient pa on pp.patient_id = pa.patient_id inner join person prs on prs.person_id=pa.patient_id where prs.death_date is not  null and pa.voided = 1;"
#--Get patients with encounter datetime after his  death  date
query_11="select  pa.*, e.date_created, prs.death_date from encounter e inner  join patient pa on pa.patient_id=e.patient_id inner  join person prs on prs.person_id=pa.patient_id where  e.date_created > prs.death_date;"

#connecting to  MySQL instance
echo "Connecting  to your mysql instance................................................"
for  db in "${db_list[@]}"mv
	do
        echo "   " 
        echo "##################################  perfoming in $db database............................................" 
            mkdir ~/epts_issue_data_finder/"$db"
            echo " executing (query_1) get enrolled patients in any program but have null date of enrollment....................."
            mysql -u $mysql_user -p$mysql_passwd -h $host -D$db -e "$query_1" >  ~/epts_issue_data_finder/"$db"/"$db"_enrolled_in_any_program_date_enrolled_null.csv
            echo " executing (query_2) Get enrolled patients in program 2 but NOT active(voided=1) ....................."
            mysql -u $mysql_user -p$mysql_passwd -h $host -D$db -e "$query_2" >  ~/epts_issue_data_finder/"$db"/"$db"_enrolled_in_program_2_but_not_active.csv
            echo " executing (query_3) Get enrolled patients in program 6 and 8 not anywhere in 1 or 2 nether do they have encounter types 5 or 7....................."
            mysql -u $mysql_user -p$mysql_passwd -h $host -D$db -e "$query_3" >  ~/epts_issue_data_finder/"$db"/"$db"_enrolled_in_program_6_8_not_in_1_2_encounter_5_7.csv
            echo " executing (query_4) Get enrolled patients in program 2 but location_id is 219 which is different from 208 we know ....................."
            mysql -u $mysql_user -p$mysql_passwd -h $host -D$db -e "$query_4" >  ~/epts_issue_data_finder/"$db"/"$db"_enrolled_in_program_2_with_location_219.csv
            echo " executing (query_5) Get enrolled patients ii program 1 and 2 but all of them voided=1....................."
            mysql -u $mysql_user -p$mysql_passwd -h $host -D$db -e "$query_5" >  ~/epts_issue_data_finder/"$db"/"$db"_enrolled_in_program_1_2_but_voided.csv
            echo " executing (query_6) Get enrolled patients in 1 but NOT active voided=1 ....................."
            mysql -u $mysql_user -p$mysql_passwd -h $host -D$db -e "$query_6" >  ~/epts_issue_data_finder/"$db"/"$db"_enrolled_in_program_1_but_not_voided.csv
            echo " executing (query_7) Get enrolled patients in program 2 but location_id is 238 which is different from 208 we know....................."
            mysql -u $mysql_user -p$mysql_passwd -h $host -D$db -e "$query_7" >  ~/epts_issue_data_finder/"$db"/"$db"_enrolled_in_program_2_with_location_2018.csv
            echo " executing (query_8) Get enrolled patients in program 2 but location_id is NULL which is different from 208 we know....................."
            mysql -u $mysql_user -p$mysql_passwd -h $host -D$db -e "$query_8" >  ~/epts_issue_data_finder/"$db"/"$db"_enrolled_in_program_2_with_location_null.csv
            echo " executing (query_9) Get all pregnant males patients....................."
            mysql -u $mysql_user -p$mysql_passwd -h $host -D$db -e "$query_9" >  ~/epts_issue_data_finder/"$db"/"$db"_all_pregnant_male_patients.csv
            echo " executing (query_10) Get patients with death date but still active in program....................."
            mysql -u $mysql_user -p$mysql_passwd -h $host -D$db -e "$query_10" >  ~/epts_issue_data_finder/"$db"/"$db"_patients_with_death_date_but_still_active_in_program.csv
            echo " executing (query_11) Get patients with encounter datetime after his  death  date....................."
            mysql -u $mysql_user -p$mysql_passwd -h $host -D$db -e "$query_11" >  ~/epts_issue_data_finder/"$db"/"$db"_get_patients_with_encounter_datetime_after_his_death_date.csv

	    echo "concluded in $db...................................................."
            
done

echo "   "
echo "Search in Data Base(s) completed ........................................  "
echo "   "

echo "The files are located in 'epts_issue_data_finder' in your home directory "


