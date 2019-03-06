# EPTS Reports - Testing scripts and ETL jobs
EPTS reports testing scripts / ETL jobs

## Getting Started
This instructions will help you run the Pentaho Data Integration transformations that generate the patient summaries that
the EPTS team uses for testing indicator reports.

## Prerequisites
* Download and install Pentaho Data Integration (PDI) version 8 (follow PDI instalaction procedure, requires JAVA). 
  This steps were validated on version 8.2.0;
* Pentaho DI Community edition can be found [here](https://community.hitachivantara.com/docs/DOC-1009931-downloads).
* Download MySQL connector version 5;

## Instalation, configuration and execution
* Extract the downloaded file on a directory of your choice `${pdi-install-dir}`;
* Copy MySQL connector jar file to `${pdi-install-dir}/data-integration/lib`;
* Open terminal on directory `${pdi-install-dir}/data-integration` and execute `./spoon.sh`;
* Click open (Ctrl+O) and open one of the transformations on this repository;
* Expand `Database Connections` under View on the left side and double click `Openmrs`;
* Fill in the correct database connection details for the openmrs database you want to generate the patient summary for;
* Click `Run` (with a play icon);
* Disable `Gather performance statistics` option to make the execution faster;
* Click `Run`;
* Once the execution of the transformation completes the resulting file will be stored under `patient-summaries`
  on your home directory;
