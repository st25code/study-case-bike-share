import pandas as pd
from pathlib import Path
import os

# 1. Determine project root reliably
project_root = Path(__file__).resolve().parents[2]
print("Project root:", project_root)

# 2. Define raw & processed directories
long_base = project_root / 'data' / 'raw' / 'long-term_monthly'
out_dir   = project_root / 'data' / 'processed'
out_file  = out_dir / 'master_longterm.csv'

print("Looking for long-term_monthly base at:", long_base)
years = ['2021', '2022', '2023']
files = []
for y in years:
    year_dir = long_base / y
    if year_dir.exists():
        year_files = sorted(year_dir.glob('*.csv'))
        print(f"{y}: found {len(year_files)} files")
        files.extend(year_files)
    else:
        print(f"WARNING: folder not found: {year_dir}")

print(f"Total files to merge: {len(files)}")

if not files:
    raise SystemExit("No files found for long-term merge, aborting.")

# 3. Read header from first file to fix canonical columns
first_file = files[0]
canonical_cols = list(pd.read_csv(first_file, nrows=0).columns)
print("Canonical columns:", canonical_cols)

# 4. Ensure output directory exists and remove old master if present
out_dir.mkdir(parents=True, exist_ok=True)
if out_file.exists():
    out_file.unlink()
    print("Deleted existing master_longterm.csv")

# 5. Iterate through files in chunks to avoid memory spikes
header_written = False
for f in files:
    print("Processing:", f.name)
    for chunk in pd.read_csv(f, chunksize=100_000):
        # align columns to canonical schema
        chunk = chunk.reindex(columns=canonical_cols)
        # append to master CSV
        chunk.to_csv(out_file, mode='a', index=False, header=not header_written)
        header_written = True

# 6. Final sanity check
# count rows in master file
row_count = 0
with open(out_file, 'r', encoding='utf-8') as fin:
    for _ in fin:
        row_count += 1
# subtract header
row_count -= 1
print(f"✅ Saved long-term master to {out_file}, total rows (excluding header): {row_count}")

