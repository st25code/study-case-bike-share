import pandas as pd
from pathlib import Path
import os

# Debug: print current working directory
print("Current working directory:", os.getcwd())

# 1. Determine project root reliably
project_root = Path(__file__).resolve().parents[2]
print("Project root:", project_root)

# 2. Define raw & processed directories
raw_base    = project_root / 'data' / 'raw'
proc_dir    = project_root / 'data' / 'processed'
last12_dir  = raw_base / 'last_12_months'

print("Raw base directory:", raw_base.exists(), raw_base)
print("Processed directory will be:", proc_dir)
print("Looking for last_12_months in:", last12_dir.exists(), last12_dir)

# Create processed folder if missing
proc_dir.mkdir(parents=True, exist_ok=True)

# 3. Collect last-12 files
monthly_files = sorted(last12_dir.glob('*.csv'))
print(f"\nFound {len(monthly_files)} monthly files:")
for f in monthly_files:
    print("  -", f.name)

# 4. Concatenate and write master

# LAST 12 MONTHS
if monthly_files:
    df_monthly = pd.concat((pd.read_csv(f) for f in monthly_files), ignore_index=True)
    out_monthly = proc_dir / 'master_last12.csv'
    df_monthly.to_csv(out_monthly, index=False)
    print(f"\nmaster_last12.csv saved to {out_monthly}, shape: {df_monthly.shape}")
else:
    print("\nWARNING: no monthly files found, skipping master_last12.csv")



