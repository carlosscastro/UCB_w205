To run the transformations, please run the scripts in the following order:

hive -f measures.sql
hive -f hospitals.sql
hive -f effective_care.sql
hive -f effective_care_ranking.sql
hive -f complications.sql
hive -f complications_ranking.sql
hive -f readmissions.sql
hive -f readmissions_ranking.sql
hive -f surveys_results.sql
hive -f hospitals_ranking.sql