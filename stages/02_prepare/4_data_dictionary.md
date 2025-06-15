# 📑 Data Dictionary

This document describes the columns in our merged “master” datasets (`cleaned_last12.csv`, `cleaned_longterm.csv`).

| Column               | Data Type   | Description                                                     |
|----------------------|-------------|-----------------------------------------------------------------|
| **ride_id**          | TEXT        | Unique identifier for each trip                                 |
| **rideable_type**    | TEXT        | Bike type (e.g. “Classic Bike”, “Electric Bike”)                |
| **started_at**       | TIMESTAMP   | Timestamp when the trip started                                 |
| **ended_at**         | TIMESTAMP   | Timestamp when the trip ended                                   |
| **start_station_name** | TEXT      | Name of the station where the trip began                        |
| **start_station_id** | INTEGER     | Unique numeric ID of the start station                          |
| **end_station_name** | TEXT        | Name of the station where the trip ended                        |
| **end_station_id**   | INTEGER     | Unique numeric ID of the end station                            |
| **start_lat**        | FLOAT       | GPS latitude of the start location                              |
| **start_lng**        | FLOAT       | GPS longitude of the start location                             |
| **end_lat**          | FLOAT       | GPS latitude of the end location                                |
| **end_lng**          | FLOAT       | GPS longitude of the end location                               |
| **member_casual**    | TEXT        | Rider category: “member” or “casual”                            |

> **Note:** All “master” tables share the same schema above. 