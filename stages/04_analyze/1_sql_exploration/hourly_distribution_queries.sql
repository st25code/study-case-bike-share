--- Load Tables
CREATE OR REPLACE TABLE processed_last12 AS
SELECT * 
FROM read_csv_auto('../../../data/processed/processed_last12.csv', HEADER=TRUE);

CREATE OR REPLACE TABLE processed_longterm AS
SELECT * 
FROM read_csv_auto('../../../data/processed/processed_longterm.csv', HEADER=TRUE);


--- Hourly Distribution (Last 12 Months May 2024 - May 2025):
SELECT 
  member_casual,                                       
  hour_of_day,
  COUNT(*) AS trip_count,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY member_casual), 2) AS trip_percentage,
  ROUND(AVG(ride_length), 2) AS avg_ride_length
FROM (
  SELECT 
    member_casual,
    CAST(strftime('%H', started_at::timestamp) AS INTEGER) AS hour_of_day,
    ride_length
  FROM processed_last12
)
GROUP BY member_casual, hour_of_day
ORDER BY trip_percentage DESC;


--- Hourly Distribution (Long-Term 2021-2023):
SELECT 
  member_casual,                                       
  hour_of_day,
  COUNT(*) AS trip_count,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY member_casual), 2) AS trip_percentage,
  ROUND(AVG(ride_length), 2) AS avg_ride_length
FROM (
  SELECT 
    member_casual,
    CAST(strftime('%H', started_at::timestamp) AS INTEGER) AS hour_of_day,
    ride_length
  FROM processed_longterm 
)
GROUP BY member_casual, hour_of_day
ORDER BY trip_percentage DESC;