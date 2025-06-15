--- Load Tables
CREATE OR REPLACE TABLE processed_last12 AS
SELECT * 
FROM read_csv_auto('../../../data/processed/processed_last12.csv', HEADER=TRUE);

CREATE OR REPLACE TABLE processed_longterm AS
SELECT * 
FROM read_csv_auto('../../../data/processed/processed_longterm.csv', HEADER=TRUE);


--- Trip Summary (Last 12 Months May 2024 - May 2025):
SELECT 
    member_casual,
    COUNT(*) AS trip_count,
    AVG(ride_length) AS avg_ride_length,
    MAX(ride_length) AS max_ride_length
FROM processed_last12
GROUP BY member_casual
ORDER BY trip_count DESC;


--- Trip Summary (Long-Term 2021-2023):
SELECT 
    member_casual,
    COUNT(*) AS trip_count,
    AVG(ride_length) AS avg_ride_length,
    MAX(ride_length) AS max_ride_length
FROM processed_longterm
GROUP BY member_casual
ORDER BY trip_count DESC;

