
----------------------
--Entity: Readmissions
----------------------

DROP TABLE IF EXISTS readmissions;

CREATE TABLE readmissions AS
SELECT ProviderID, MeasureID, ComparedNational, Denominator, Score, LowerEstimate, HigherEstimate
FROM readmissions_raw
WHERE Denominator <> 'Not Available'
AND Score <> 'Not Available'
AND HigherEstimate <> 'Not Available'
AND LowerEstimate <> 'Not Available';
