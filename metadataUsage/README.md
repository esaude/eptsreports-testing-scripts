# Generate Metadata usage statistics
> This Script helps to generate csv files including used metadata objects currently; concepts, programs, patient identifier types, person attribute types, roles, global properties, locations

### Running the script
>  `./openmrsMetadataUsage.sh ~/Projects/jembi/esaude/openmrs-standalone-1.11.5_2/database/bin/./mysql openmrs '--socket=/tmp/esaude3.sock --max_allowed_packet=96M' openmrs`
Enter Mysql password.

### Results
> If running it returned no errors quiting execution, then three folders should have been created 3 folders; `data, failed, usage`
```
   drwxr-xr-x  ... data
   drwxr-xr-x  ... failed
   -rwxr-xr-x@ ... openmrsMetadataUsage.sh
   drwxr-xr-x  ... usage
   ```
   `data`: contains xml forms export from the database as well as metadata fields extracts
   `failed`: contains failed xml forms which need human intervention, the details of what failed in text files
   `usage`: contains csv output per exported metadata objects
