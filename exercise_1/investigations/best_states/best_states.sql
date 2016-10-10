
--------------------------------
--Query: Best States
--Cross Reference: For a detailed explanation of the scaling and creation of scores, please refer to exercise_1/investigations/best_hospitals/best_hospitals.txt
--and exercise_1/investigations/best_states/best_states.txt
--------------------------------

select h.State, avg(hr.OverallScore) as AverageScore
from hospitals_ranking hr
inner join hospitals h
on hr.ProviderID = h.ProviderID
group by h.State
order by AverageScore desc
limit 10;

