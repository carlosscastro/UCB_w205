
DROP TABLE IF EXISTS hospitals_raw;
CREATE EXTERNAL TABLE hospitals_raw(
    ProviderID string,
    HospitalName string,
    Address string,
    City string,
    State string,
    ZipCode string,
    CountyName string,
    PhoneNumber string,
    HospitalType string,
    HospitalOwnership string,
    EmergencyServices string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = '"',
    "escapeChar" = '\\')
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';

DROP TABLE IF EXISTS surveys_results_raw;
CREATE EXTERNAL TABLE surveys_results_raw(
    ProviderID string,
    HospitalName string,
    Address string,
    City string,
    State string,
    ZIPCode string,
    CountyName string,
    CommunicationNursesAchievementPoints string,
    CommunicationNursesImprovementPoints string,
    CommunicationNursesDimensionScore string,
    CommunicationDoctorsAchievementPoints string,
    CommunicationDoctorsImprovementPoints string,
    CommunicationDoctorsDimensionScore string,
    ResponsivenessHospitalStaffAchievementPoints string,
    ResponsivenessHospitalStaffImprovementPoints string,
    ResponsivenessHospitalStaffDimensionScore string,
    PainManagementAchievementPoints string,
    PainManagementImprovementPoints string,
    PainManagementDimensionScore string,
    CommunicationMedicinesAchievementPoints string,
    CommunicationMedicinesImprovementPoints string,
    CommunicationMedicinesDimensionScore string,
    CleanlinessQuietnessHospitalEnvironmentAchievementPoints string,
    CleanlinessQuietnessHospitalEnvironmentImprovementPoints string,
    CleanlinessQuietnessHospitalEnvironmentDimensionScore string,
    DischargeInformationAchievementPoints string,
    DischargeInformationImprovementPoints string,
    DischargeInformationDimensionScore string,
    OverallatingHospitalAchievementPoints string,
    OverallRatingHospitalImprovementPoints string,
    OverallRatingHospitalDimensionScore string,
    HCAHPSBaseScore string,
    HCAHPSConsistencyScore string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = '"',
    "escapeChar" = '\\')
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/surveys_responses';

DROP TABLE IF EXISTS measures_raw;
CREATE EXTERNAL TABLE measures_raw(
    MeasureName string,
    MeasureID string,	
    MeasureStartQuarter string,
    MeasureStartDate string,
    MeasureEndQuarter string,
    MeasureEndDate string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = '"',
    "escapeChar" = '\\')
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measures';

DROP TABLE IF EXISTS readmissions_raw;
CREATE EXTERNAL TABLE readmissions_raw(
    ProviderID string,
    HospitalName string,
    Address string,
	City string,
    State string,
    ZIPCode string,
    CountyName string,
    PhoneNumber string,
    MeasureName string,
    MeasureID string,
    ComparedNational string,
    Denominator string,
    Score string,
    LowerEstimate string,
    HigherEstimate string,
    Footnote string,
    MeasureStartDate string,
    MeasureEndDate string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = '"',
    "escapeChar" = '\\')
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions';

DROP TABLE IF EXISTS effective_care_raw;
CREATE EXTERNAL TABLE effective_care_raw(
    ProviderID string,
    HospitalName string,
    Address string,
    City string,
    State string,
    ZIPCode string,
    CountyName string,
    PhoneNumber string,
    Condition string,
    MeasureID string,
    MeasureName string,
    Score string,
    Sample string,
    Footnote string,
    MeasureStartDate string,
    MeasureEndDate string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = '"',
    "escapeChar" = '\\')
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care';

DROP TABLE IF EXISTS complications_raw;
CREATE EXTERNAL TABLE complications_raw(
    ProviderID string,
    HospitalName string,
    Address string,
    City string,
    State string,
    ZIPCode string,
    CountyName string,
    PhoneNumber string,
    MeasureName string,
    MeasureID string,
    ComparedNational string,
    Denominator string,
    Score string,
    LowerEstimate string,
    HigherEstimate string,
    Footnote string,
    MeasureStartDate string,
    MeasureEndDate string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = '"',
    "escapeChar" = '\\')
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/complications';


