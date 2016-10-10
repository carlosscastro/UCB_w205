
-------------------------
--Entity: Surveys Results
-------------------------

DROP TABLE IF EXISTS surveys_results;

CREATE TABLE surveys_results AS
SELECT ProviderID, HCAHPSBaseScore as GeneralScore, HCAHPSConsistencyScore as ConsistencyScore
FROM surveys_results_raw
WHERE CAST(HCAHPSBaseScore AS BIGINT) IS NOT NULL
AND CAST(HCAHPSConsistencyScore AS BIGINT) IS NOT NULL;