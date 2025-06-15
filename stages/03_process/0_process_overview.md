# 🔧 Phase 03: Process

## 🎯 Goal
Prepare the cleaned datasets for analysis by transforming key fields and adding derived variables.

---

## ✅ Key Tasks
- Check the data for errors or inconsistencies
- Choose appropriate tools for transformation (e.g., DuckDB, Python, R)
- Perform transformations to extract useful variables:
  - `ride_length` (duration in minutes)
  - `day_of_week` (numeric day of the week)
  - `hour_of_day` (time-based segmentation)
- Document all changes and processing logic

---

## 🧰 Tools
- Python (Pandas + DuckDB)
- Optional: R or Excel (for quick validation or preview)

---

## 🗂️ Input Datasets
From `data/processed/`:
- `cleaned_last12.csv` (May 2024 – May 2025)
- `cleaned_longterm.csv` (2021 – 2023)

---

## 📝 Deliverables
- A fully documented `.ipynb` notebook with all transformations
- Final ready-to-analyze datasets:
  - `processed_last12_ready.csv`
  - `processed_longterm_ready.csv`

---

## 🚀 Next Step
Start transforming the `cleaned_*.csv` datasets:
- Calculate `ride_length` = `ended_at - started_at` in minutes
- Extract `day_of_week` and `hour_of_day` from `started_at`
- Remove outliers (e.g., negative or extreme ride durations)

