
--------------------------------
--Entity: Hospitals Ranking
--Cross Reference: For a detailed explanation of the scaling and creation of scores, please refer to exercise_1/investigations/best_hospitals/best_hospitals.txt
--------------------------------

-------------------------------
-- Auxiliary table: Hospitals aggregated ranking
-- Description: holds adjusted and weighted scores for each measure, for each hospital and for each metric (complications, readmissions and effective care)
-------------------------------

DROP TABLE IF EXISTS hospitals_aggregated_ranking;
CREATE TABLE hospitals_aggregated_ranking AS
select * from ( 
select providerId, WeightedScore from readmissions_ranking
union all 
select providerId, WeightedScore from complications_ranking 
union all 
select providerId, WeightedScore from effective_care_ranking) aggregated;


-------------------------------
--Entity: Hospitals ranking
--Description: Weighted and averaged score of all the metrics (readmissions, complications and effective care) for each hospital for each procedure
-------------------------------

DROP TABLE IF EXISTS hospitals_ranking;
CREATE TABLE hospitals_ranking AS
select hr.ProviderID, avg(hr.WeightedScore) as OverallScore
from hospitals_aggregated_ranking hr
group by hr.ProviderID;
