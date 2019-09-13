#!/bin/bash
#This  script sources all the files found in given folder


#Collecting MySQL credential
echo "Collecting MySQL credentials........................................................................"
echo "MySQL User: "
read mysql_user
echo "MySQL Password: "
read -s mysql_passwd
#echo "MySQL IP: "
#read host
host="localhost"

# validate the MySQL Credentials
until mysql -u $mysql_user -p$mysql_passwd -h $host -e ";" ; do
        echo "Can't connect to MySQL, please retry..."
        echo "MySQL User: "
        read mysql_user
        echo "MySQL Password: "
        read -s mysql_passwd
        #echo "MySQL IP: "
        host="localhost"
done


        echo "What is the name you want to give to new harmonized database to be prepared?"
        read db
        #Criar base de dados
        
        mysql -u $mysql_user -p$mysql_passwd -h $host -e "CREATE DATABASE $db CHARACTER SET utf8 COLLATE utf8_general_ci"
                                
        echo "concluded in $db...................................................."
        
        #Fazer o undump da base de dados limpa
        for  entry in "Dump"/*.sql
                do
                echo "   " 
                
                #      echo " Here is the query: $sql" ## for debugging
                
                mysql -u $mysql_user -p$mysql_passwd -h $host -D$db -e "source $entry"
                                
                echo "concluded in $entry...................................................."
                
        done
        #carregar todos os conceitos
        for  entry in "Concepts"/*.sql
                do
                echo "   " 
                
                #      echo " Here is the query: $sql" ## for debugging
                mysql -u $mysql_user -p$mysql_passwd -h $host -D$db -e "source $entry"
                                
                echo "concluded in $entry...................................................."
                
        done
        #Carregar todos os metas excluindo forms
        for  entry in "metasql"/*.sql
                do
                echo "   " 
                
                #      echo " Here is the query: $sql" ## for debugging
                mysql -u $mysql_user -p$mysql_passwd -h $host -D$db -e "source $entry"
                                
                echo "concluded in $entry...................................................."
                
        done

        for  entry in "update"/*.sql
                do
                echo "   " 
                
                #      echo " Here is the query: $sql" ## for debugging
                mysql -u $mysql_user -p$mysql_passwd -h $host -D$db -e "source $entry"
                                
                echo "concluded in $entry...................................................."
                
        done

        #Carregar os forms
        for  entry in "Form"/*.sql
                do
                echo "   " 
                
                #      echo " Here is the query: $sql" ## for debugging
                sed -i 's/@saved_cs_client/"utf8"/g' $entry
                mysql -u $mysql_user -p$mysql_passwd -h $host -D$db -e "source $entry"
                                
                echo "concluded in $entry...................................................."
                
        done

        #Carregar os html
       for  entry in "Html"/*.sql
                do
                echo "   " 

                #      echo " Here is the query: $sql" ## for debugging
                sed -i 's/@saved_cs_client/"utf8"/g' $entry
                mysql -u $mysql_user -p$mysql_passwd -h $host -D$db -e "source $entry"

                echo "concluded in $entry...................................................."

        done

echo "   "
echo "Source in Data Base(s) completed ........................................  "
echo "..........................."
echo ".................................."
echo "........................................"
echo "............................................."
echo "   "
read ps