
--------------------------------
--Query: Correlation of hospital quality and patient surveys
--Cross Reference: For a detailed explanation of the variability measures, please refer to exercise_1/investigations/hospitals_and_patients/hospitals_and_patients.txt
--------------------------------

select corr(hr.OverallScore, sr.GeneralScore + sr.ConsistencyScore)
from hospitals_ranking hr
inner join surveys_results sr
on hr.ProviderID = sr.ProviderID
