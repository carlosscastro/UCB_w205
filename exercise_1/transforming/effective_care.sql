
------------------------
--Entity: Effective Care
------------------------

DROP TABLE IF EXISTS effective_care;

CREATE TABLE effective_care AS 
SELECT ProviderID, MeasureID, Condition, Score, Sample
FROM effective_care_raw
WHERE CAST(Score as BIGINT) is not NULL
AND CAST(Sample as BIGINT) is not NULL;
