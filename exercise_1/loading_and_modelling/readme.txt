Prerequisites:

1- Run under W205 user
2- Hadoop and hive setup and running
3- All the contents of the git repo need to be downloaded to the UCB AMI
4- W205 user  needs to have execute write permissions on the load_data_lake.sh.
5- W205 user needs to have write access in all the directory tree of the git repo where it will be run. I applied chmod 777 to all the directory tree for simplicity.

Steps to set up data lake:

1-Download the contents of the git repo to a UCB AMI
2-Navigate to where the load_data_lake.sh script is (<your directory>/UCB_w205/exercise_1/loading_and_modelling), so that the current working directory (pwd) is in the script's directory
2-Run the load_data_lake.sh script
3-Wait for completion. See next steps in script output for reference
4-Create the tables through hive -f hive_base_ddl.sql 