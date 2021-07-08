# Generate Metadata usage statistics
> This OpenMRS Script helps to generate csv files including used metadata objects currently used in eSaude environments; concepts, programs, patient identifier types, person attribute types, roles, global properties, locations. The script can be pointed at-least one database through params.json which contains MySQL connection details from which the separated usages are obtained


### Setup
> This script has been written against OS X El Capitan 10.11.6 (15G22010), in any case running against another OS or version complains about any external dependencies such as `xmllint`, `jq`, `bc` etc, please manually install those and proceed.
Configure mysql instances to extract metadata usages within `params.json`, here's a sample content and the this file needs to be in the same folder as the script
```json
{
  "mysqlDbConnections": [
    {
      "binaryLocation": "mysql",
      "options": "",
      "database": "openmrs",
      "username": "root",
      "password": ""
    },
    {
      "binaryLocation": "mysql",
      "options": "",
      "database": "esaude",
      "username": "root",
      "password": ""
    },
    {
      "binaryLocation": "/Users/u/Programs/openmrs-standalone/database/./mysql",
      "options": "--socket=/tmp/esaude3.sock --max_allowed_packet=96M",
      "database": "openmrs",
      "username": "openmrs",
      "password": "test"
    },
    {
      "binaryLocation": "mysql",
      "options": "",
      "database": "openmrs",
      "username": "root",
      "password": "$MYSQL_ROOT_PASSWORD"
    }
  ]
}
```

### Running the script
>  Run; `./openmrsMetadataUsage.sh`

### Results
> If running it returned no errors (logged into `log.out`) while quitting execution, then three folders should have been created 3 folders; `data, failed, usage`
```
   drwxr-xr-x  ... data
   drwxr-xr-x  ... failed
   -rw-r--r--  ... log.out
   -rwxr-xr-x@ ... openmrsMetadataUsage.sh
   drwxr-xr-x  ... usage
   ```
   `data`: contains xml forms export from the database as well as metadata field extracts
   `failed`: contains failed xml forms which need human intervention, the details of what failed in text files such as; `*_form_failed.txt`
   `usage`: contains csv output per exported metadata objects

### Troubleshooting
> if genarated `usage` folder is empty while `/var/lib/mysql-files/` contains generated csv files, you can move it manually as `root` or with `sudo` typing:
```
   `mv /var/lib/mysql-files/*.csv usage/`
```