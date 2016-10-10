--------------------------------
--Entity: Effective Care Ranking
--Cross Reference: For a detailed explanation of the scaling and creation of scores, please refer to exercise_1/investigations/best_hospitals/best_hospitals.txt
--------------------------------

-------------------------------
-- Auxiliary table: Effective care max
-- Description: holds max and min scores for effective care for each measure. 
-------------------------------

DROP TABLE IF EXISTS effective_care_max;
CREATE TABLE effective_care_max AS
select r.MeasureId, 
max(cast(r.score as double)) as MaxScore, 
min(cast(r.score as double)) as MinScore,
count(r.score) as ScoreCount
from effective_care r
group by r.MeasureId;


-------------------------------
-- Auxiliary table: Effective care adjusted
-- Description: holds adjusted scores for effective care. The adjusted scores are scaled to a 0-100 scale where 100 is the best possible result
-------------------------------

DROP TABLE IF EXISTS effective_care_adjusted;
CREATE TABLE effective_care_adjusted AS
select r.ProviderId, 
r.MeasureId, 
(r.Score* 100) / rmax.MaxScore as AdjustedScore
from effective_care r
inner join effective_care_max rmax
on r.MeasureId = rmax.MeasureId;

-------------------------------
--Entity: Effective care ranking
--Description: Weighted score for each hospital and for each procedure, factoring the number of metrics used to generate the score. More metrics is better.
-------------------------------

DROP TABLE IF EXISTS effective_care_ranking;
CREATE TABLE effective_care_ranking AS
select ra.ProviderId, 
avg(ra.AdjustedScore) as SumarizedScore,
avg(ra.AdjustedScore) - ((avg(ra.AdjustedScore) / 25) * (measureCounts.ScoreCount - count(ra.AdjustedScore))) as WeightedScore,
count(ra.AdjustedScore) as Ct,
measureCounts.ScoreCount as scoreCount
from effective_care_adjusted ra
inner join effective_care_max rm
on ra.MeasureId = rm.MeasureId
inner join (
	select count(distinct r.MeasureId) as ScoreCount
	from effective_care r
) as measureCounts
group by ra.providerId, measureCounts.ScoreCount;
