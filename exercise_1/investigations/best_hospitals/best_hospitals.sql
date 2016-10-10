
--------------------------------
--Query: Best Hospitals
--Cross Reference: For a detailed explanation of the scaling and creation of scores, please refer to exercise_1/investigations/best_hospitals/best_hospitals.txt
--------------------------------

select h.ProviderID, h.HospitalName, h.State, hr.OverallScore
from hospitals_ranking hr
inner join hospitals h
on hr.ProviderID = h.ProviderID
order by hr.OverallScore desc
limit 10;
