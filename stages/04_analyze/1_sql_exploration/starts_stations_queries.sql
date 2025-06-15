--- Load Tables
CREATE OR REPLACE TABLE processed_last12 AS
SELECT * 
FROM read_csv_auto('../../../data/processed/processed_last12.csv', HEADER=TRUE);

CREATE OR REPLACE TABLE processed_longterm AS
SELECT * 
FROM read_csv_auto('../../../data/processed/processed_longterm.csv', HEADER=TRUE);


--- Top 10 Start Stations By Member And Casual (Last 12 Months May 2024 - May 2025):
SELECT *
FROM (
  SELECT 
    member_casual,
    start_station_name,
    COUNT(*) AS trip_count,
    ROW_NUMBER() OVER (PARTITION BY member_casual ORDER BY COUNT(*) DESC) AS rn
  FROM processed_last12
  GROUP BY member_casual, start_station_name
)
WHERE rn <= 10
ORDER BY member_casual, rn;


--- Top 10 Start Stations By Member And Casual (Long-Term 2021-2023):
SELECT *
FROM (
  SELECT 
    member_casual,
    start_station_name,
    COUNT(*) AS trip_count,
    ROW_NUMBER() OVER (PARTITION BY member_casual ORDER BY COUNT(*) DESC) AS rn
  FROM processed_longterm
  GROUP BY member_casual, start_station_name
)
WHERE rn <= 10
ORDER BY member_casual, rn;