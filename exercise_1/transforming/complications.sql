
-----------------------
--Entity: Complications
-----------------------

DROP TABLE IF EXISTS complications;

CREATE TABLE complications AS
SELECT ProviderID, MeasureID, ComparedNational, Denominator, Score, LowerEstimate, HigherEstimate
FROM complications_raw
WHERE CAST(Denominator AS DOUBLE) IS NOT NULL
AND CAST(Score AS DOUBLE) IS NOT NULL
AND CAST(HigherEstimate AS DOUBLE) IS NOT NULL
AND CAST(LowerEstimate AS DOUBLE) IS NOT NULL;
