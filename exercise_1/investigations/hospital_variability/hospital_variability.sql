

--------------------------------
--Query: Hospital Variability Method 1: Range as variability measure
--Cross Reference: For a detailed explanation of the variability measures, please refer to exercise_1/investigations/hospital_variability/hospital_variability.txt
--------------------------------

select measures.MeasureId, measures.MeasureName, variability.Variability from (
select MeasureID, minScore / maxScore as Variability
from complications_max
union all
select MeasureID, minScore / maxScore as Variability
from readmissions_max
union all
select MeasureID, minScore / maxScore as Variability
from complications_max
) as variability
inner join measures
on variability.MeasureID = measures.MeasureID
order by variability.Variability asc
limit 10;

--------------------------------
--Query: Hospital Variability Method 2: Variance as variability measure
--Cross Reference: For a detailed explanation of the variability measures, please refer to exercise_1/investigations/hospital_variability/hospital_variability.txt
--------------------------------

select measures.MeasureId, measures.MeasureName, variability.Variability from (

select MeasureID, var_samp(Score) as Variability
from complications
group by MeasureID
union all
select MeasureID, var_samp(Score) as Variability
from readmissions
group by MeasureID
union all
select MeasureID, var_samp(Score) as Variability
from effective_care
group by MeasureID

) as variability
inner join measures
on variability.MeasureID = measures.MeasureID
order by variability.Variability asc
limit 10;