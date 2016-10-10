
echo "Downloading hospital data..."

wget -O /home/w205/exercise_1/loading_and_modelling/hospital_data.zip https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip

cd /home/w205/exercise_1/loading_and_modelling/

echo "Decompressing hospital data..."
unzip hospital_data.zip 
echo "Decompression completed"

mv "Hospital General Information.csv" hospitals.csv
mv "Timely and Effective Care - Hospital.csv" effective_care.csv
mv "Readmissions and Deaths - Hospital.csv" readmissions.csv
mv Measure\ Dates.csv measures.csv
mv hvbp_hcahps_05_28_2015.csv surveys_responses.csv
mv Complications\ -\ Hospital.csv complications.csv

echo "Removing headers from csv files..."

tail -n +2 hospitals.csv > final_hospitals.csv
tail -n +2 effective_care.csv > final_effective_care.csv
tail -n +2 readmissions.csv > final_readmissions.csv
tail -n +2 measures.csv > final_measures.csv
tail -n +2 surveys_responses.csv > final_surveys_responses.csv
tail -n +2 complications.csv > final_complications.csv

echo "Removing headers from csv files completed"

echo "Creating hdfs directory structure..."

hdfs dfs -mkdir /user/w205/hospital_compare

hdfs dfs -mkdir /user/w205/hospital_compare/complications
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -mkdir /user/w205/hospital_compare/measures
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -mkdir /user/w205/hospital_compare/surveys_responses

echo "Transferring csv files to hdfs..."

hdfs dfs -put final_complications.csv /user/w205/hospital_compare/complications
hdfs dfs -put final_effective_care.csv /user/w205/hospital_compare/effective_care
hdfs dfs -put final_hospitals.csv /user/w205/hospital_compare/hospitals
hdfs dfs -put final_measures.csv /user/w205/hospital_compare/measures
hdfs dfs -put final_readmissions.csv /user/w205/hospital_compare/readmissions
hdfs dfs -put final_surveys_responses.csv /user/w205/hospital_compare/surveys_responses

echo "Transferring csv files to hdfs completed"

echo "Next step is to create the tables. Run the following command to do that: hive -f hive_base_ddl.sql"
echo "After creating the tables, run the sql files under transformations to create the transformed tables, and then run the sql files under investigations to get results for the questions required."

