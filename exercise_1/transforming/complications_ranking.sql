
--------------------------------
--Entity: Complications Ranking
--Cross Reference: For a detailed explanation of the scaling and creation of scores, please refer to exercise_1/investigations/best_hospitals/best_hospitals.txt
--------------------------------

-------------------------------
-- Auxiliary table: Complications max
-- Description: holds max and min scores for Complications for each measure. 
-------------------------------


DROP TABLE IF EXISTS complications_max;
CREATE TABLE complications_max AS
select r.MeasureId, 
max(cast(r.score as double)) as MaxScore, 
min(cast(r.score as double)) as MinScore,
count(r.score) as ScoreCount
from complications r
group by r.MeasureId;

-------------------------------
-- Auxiliary table: Complications adjusted
-- Description: holds adjusted scores for Complications. The adjusted scores are inverted and scaled to a 0-100 scale where 100 is the best possible result
-------------------------------

DROP TABLE IF EXISTS complications_adjusted;
CREATE TABLE complications_adjusted AS
select r.ProviderId, 
r.MeasureId, 
((rmax.MaxScore - r.Score)* 100) / (rmax.MaxScore - rmax.MinScore) as AdjustedScore
from complications r
inner join complications_max rmax
on r.MeasureId = rmax.MeasureId;

-------------------------------
--Entity: Complications ranking
--Description: Weighted score for each hospital and for each procedure, factoring the number of metrics used to generate the score. More metrics is better.
-------------------------------

DROP TABLE IF EXISTS complications_ranking;
CREATE TABLE complications_ranking AS
select ra.ProviderId, 
avg(ra.AdjustedScore) as SumarizedScore,
avg(ra.AdjustedScore) - ((avg(ra.AdjustedScore) / 25) * (measureCounts.ScoreCount - count(ra.AdjustedScore))) as WeightedScore,
count(ra.AdjustedScore) as Ct,
measureCounts.ScoreCount as scoreCount
from complications_adjusted ra
inner join complications_max rm
on ra.MeasureId = rm.MeasureId
inner join (
	select count(distinct r.MeasureId) as ScoreCount
	from complications r
) as measureCounts
group by ra.providerId, measureCounts.ScoreCount;

