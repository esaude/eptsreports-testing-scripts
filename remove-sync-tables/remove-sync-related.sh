#!/bin/bash
#World of short cuts
#This script will help you remove all the sync tables related
#Jembi 2019

#Collecting MySQL credential

echo "Collecting MySQL credentials........................................................................"
echo "MySQL User: "
read mysql_user
echo "MySQL Password: "
read -s mysql_passwd
echo "MySQL IP: "
read host

#write all the out put to a file for show database
mysql -u $mysql_user -p$mysql_passwd -h $host -e "show databases;" >  temp_file.txt

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

echo "Here is the list I will be working on ${db_list[@]}"
echo ""
echo "Do you which to continue... [y/n] (lower case please)"
read continuar

if [ $continuar == "n" ]
        then
         exit 1
fi
declare -A queries
queries[0]="DROP TABLE sync_server_record;"
queries[1]="DROP TABLE sync_server_class;"
queries[2]="DROP TABLE sync_server;"
queries[3]="DROP TABLE sync_class;"
queries[4]="DROP TABLE sync_record;"
queries[5]="DROP TABLE sync_import;"
queries[6]="DELETE FROM global_property WHERE property LIKE 'sync.%';"
queries[7]="DELETE FROM scheduler_task_config_property WHERE task_config_id IN (SELECT task_config_id FROM scheduler_task_config WHERE name = '* Synchronization');"
queries[8]="DELETE FROM scheduler_task_config WHERE name = '* Synchronization';"

#connecting to  MySQL instance
echo "Connecting  to your mysql instance................................................"
for  db in "${db_list[@]}"
        do
	echo "   "
        echo "##################################  perfoming in $db database............................................"

        for((i=0;i<=8;i++));
        do
             echo "${queries[$i]}"
             mysql -u $mysql_user -p$mysql_passwd -h $host -D$db -e "${queries[$i]}"
        done

	echo "concluded in $db...................................................."

done

echo "   "
echo "work in Data Base(s) completed ........................................  "
echo "..........................."
echo ".................................."
echo "........................................"
echo "............................................."
echo "   "