
--------------------
--Entity: Measures
--------------------

DROP TABLE IF EXISTS measures;
CREATE TABLE measures AS SELECT MeasureName, MeasureID FROM measures_raw;