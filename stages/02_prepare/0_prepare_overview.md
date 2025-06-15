## Data Sources
- **`data/raw/last_12_month/`**  
  CSV files from **May 2024** through **May 2025** (primary analysis window).
- **`data/raw/long-term_monthly/`**  
  Monthly CSVs from **Q2 2020** through **Q4 2023** (long-term context).

## 🗂️ Folder & File Structure

```
project-root/
├─ data/
│  ├─ raw/
│  │  ├─ last_12_month/         # Monthly CSVs from May 2024 to May 2025
│  │  └─ long-term_monthly/     # Monthly CSVs from 2021 to 2023
│  └─ processed/
│     ├─ master_last12.csv       # Merged from May 2024 to May 2025 dataset
│     ├─ master_longterm.csv     # Merged 3-year dataset (2021–2023)
│     ├─ cleaned_last12.csv      # Cleaned and filtered last12 dataset
│     └─ cleaned_longterm.csv    # Cleaned and filtered longterm dataset
├─ stages/
│  └─ 02_prepare/
│     ├─ 0_prepare_overview.md         # Phase summary & structure
│     ├─ 1_1_merge_last12_moths.ipynb  # Merge script for last12 data
│     ├─ 1_2_merge_longterm.ipynb      # Merge script for longterm data
│     ├─ 2_review_new_datasets.ipynb   # Validation: preview, monthly counts, deduplication
│     ├─ 3_sorting_filtering.ipynb     # Credibility check & filtering logic
│     └─ 4_data_dictionary.md          # Description of final cleaned dataset columns

```
## Key Tasks
1. **Combine raw CSVs** into two master tables (`master_last12.csv`, `master_longterm.csv`).  
2. **Validate** file formats, column consistency, and record counts.  
3. **Sort and filter the data** (in `sorting_filtering.ipynb` or separate note):  
   - Ensure chronological order by `started_at`.  
   - Filter out any malformed or duplicate files.  
4. **Determine the credibility of the data**:  
   - Check for missing or null values in critical fields.  
   - Identify and handle extreme outliers in trip durations or coordinates.  
5. **Document** initial cleaning and transformations (e.g., date parsing, column renames).


## Next Steps
- Run the ingestion and merge scripts to generate master datasets in `data/processed/`.  
- Verify that the data is sorted, filtered, and credible.  
- Proceed to **Stage 03 – Process** for detailed cleaning and feature engineering.  

