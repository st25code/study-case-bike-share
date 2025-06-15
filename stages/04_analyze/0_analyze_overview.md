# 📊 Phase 04: Analyze

## 🎯 Goal
Perform descriptive analysis of cleaned Cyclistic trip data to identify trends, patterns, and relationships that help explain how casual riders and annual members use the service differently.

---

## 🧩 Key Tasks
- Organize and format cleaned data for analysis
- Aggregate data using SQL queries (via DuckDB)
- Generate summary tables for ride patterns and user behavior
- Calculate descriptive statistics (mean, max, mode, etc.)
- Identify trends across time (weekday, hour, seasonality, ride type)

> ⚠️ **Note:** All visualizations and communication of findings will be completed in Phase 05: Share.

---

## ❓ Guiding Questions
- How should you organize your data to perform analysis on it?
- Has your data been properly formatted?
- What trends or relationships did you find in the data?
- How will these insights help answer your business questions?

---

## 🗂️ Folder & File Structure

```
04_analyze/
├─ 0_analyze_overview.md # This file
├─ 1_sql_exploration/ # Clean SQL queries for summary data
│ ├─ avg_ride_length.sql
│ ├─ trips_by_day_hour.sql
│ └─ ...
├─ 2_python_processing/ # DuckDB + pandas scripts for running queries and saving CSVs
│ └─ analyze_queries.ipynb
├─ 3_r_summary_tables/ # Optional: summary tables prepared for visualization in R
│ └─ cleaned_summaries_for_R.csv
├─ 4_exports/ # Aggregated result tables ready for visualizations in Phase 05
│ ├─ avg_by_day.csv
│ ├─ trip_counts_by_user.csv
│ ├─ ride_type_distribution.csv
│ └─ ...
```

---

## 🛠️ Tools Used
- **DuckDB (via Python)** for fast SQL-based aggregation
- **Pandas** for minimal post-processing and CSV export
- **R** (optional) for additional statistical summary or pre-visual inspection

---

## ✅ Output of This Phase
- A set of clean, aggregated `.csv` tables describing ride behavior
- Summary metrics and trends for use in final visual presentation
- No visualizations yet — only structured numerical insights