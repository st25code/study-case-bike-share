# 🚲 Cyclistic Bike-Share Case Study

## 📋 Project Overview
**Objective**: Answer the question: **How do casual riders and annual members use Cyclistic bikes differently?**  
Deliverable: A report with visualizations, key insights, and three recommendations to increase conversion from casual riders to members.

## 🗄️ Data

The analysis is based on **Cyclistic’s historical trip data**.  
All raw datasets are available on Divvy’s official repository:  
🔗 [Divvy Trip Data Archive](https://divvy-tripdata.s3.amazonaws.com/index.html)

### 📂 Raw Data
- **Last 12 months** (May 2024 – May 2025): stored in `data/raw/last_12_months`
- **Long-term data** (Jan 2021 – Dec 2023): stored in `data/raw/long-term_monthly`

### ⚙️ Processed Data
Due to the large file size, processed and merged datasets are stored outside of the repository:

- `master_last12` → combined dataset for the last 12 months  
- `master_longterm` → combined dataset for 2021–2023  
- `cleaned_last12` / `cleaned_longterm` → cleaned versions of the datasets  
- `processed_last12` / `processed_longterm` → engineered and feature-enriched tables  

These processed files are **not included** in the repo but can be reproduced by running the preprocessing scripts in `notebooks/` or `scripts/`.

---

## 🛠️ Project Phases
> All phases are organized under the `stages/` directory (01_ask…06_act).

### 1. Ask 🕵️
- **Goal**: Identify behavioral differences between casual vs. member riders.
- **Deliverable**: Questions & hypotheses (`stages/01_ask/ask_overview.ipynb`).

### 2. Prepare 📥
- **Tasks**:
  - Organize raw CSV files into `data/raw/...`.
  - Load raw data into SQL.
  - Write SQL script to merge into master tables.

### 3. Process 🧹
- **Tasks**:
  - Use SQL to clean and filter master tables (remove zero/negative durations, duplicates).
  - Add computed columns: `ride_length`, `day_of_week`, `hour_of_day`.

### 4. Analyze 🔍
- **Tasks**:
  - Perform analysis in R (tidyverse): summary stats, time-based trends, seasonality.

### 5. Share 📊
- **Tasks**:
  - Create visuals in R/Plotly or Tableau.
  - Develop an interactive dashboard (Shiny/Tableau/Dash).
  - Compile slides & PDF report.

### 6. Act 🏁
- **Tasks**:
  - Formulate three recommendations to convert casual riders to members.

---

## 🗂️ Project Structure

- **data/**
  - **raw/**
    - **last_12_month/**: May 2024–May 2025 CSVs
    - **long-term_monthly/**: 2021-2023 CSVs
  - **processed/**: master_last12.csv, master_longterm.csv, 
                    cleaned_last12.csv, cleaned_longterm.csv
                    processed_last12.csv, processed_longterm.csv
                    
- **stages/**
  - **01_ask/**: ask_overview.ipynb

  - **02_prepare/**: 0_prepare_overview.md, 1_1_merge_last12_moths, 1_2_merge_longterm, 
                     2_review_new_datasets.ipynb, 3_sorting_filtering.ipynb, 4_data_dictionary.md

  - **03_process/**: 0_process_overview.md, 1_processing.ipynb, 2_processed_data_dictionary

  - **04_analyze/**: 0_analyze_overview.md, 1_sql_exploration (.sql, ...), 2_python_processing 
                     (analyze_queries.ipynb), 3_r_summary_tables, 4_exports (.csv, ...)

  - **05_share/**: slides_presentation/, visualisations/, cyclistic_visualisations.R, 
                   0_share_overview.md, summary_findings.md
  - **06_act/**: recommendations.md

- **README.md**: this file
- **study-case-tasks.pdf**: case study task description
- **final_presentation.pdf**: presentation of data analysis results to stakeholders

---