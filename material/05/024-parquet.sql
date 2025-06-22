-- DuckDB can directly query Parquet files (and also offers a peek
-- at the Parquet metadata at the file and row group levels).


-- The New York City Taxi & Limousine Commission (TLC) publishes
-- monthly reports on all rides taken with their famous
-- "Yellow Cab" fleet of taxis.  [also: Green Cabs, Uber, Citi Bikes]
--
-- Since May 2022, these reports are published as Parquet files
-- (formerly: CSV).
--
-- See https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page


-- Yellow Cab rides in April 2019 (121 MB, 7.4 M rows)
.shell ls -lh taxi/nyc-yellow-cabs-2019-04.parquet
.shell file taxi/nyc-yellow-cabs-2019-04.parquet

-- Reading Parquet files (see https://duckdb.org/docs/stable/data/parquet/overview.html):
--
-- 1. via table function read_parquet(‹file›)
FROM  read_parquet('taxi/nyc-yellow-cabs-2019-04.parquet')
LIMIT 10;

-- 2. via reference to a *.parquet file name on disk
FROM 'taxi/nyc-yellow-cabs-2019-04.parquet'
LIMIT 10;

-- Overview of schema (column_type shows DuckDB types)
DESCRIBE 'taxi/nyc-yellow-cabs-2019-04.parquet';

-- Overview of schema as defined by Parquet via built-in
-- table function parquet_schema(‹file›).
-- Column type shows Parquet types before they are mapped to DuckDB types):
FROM parquet_schema('taxi/nyc-yellow-cabs-2019-04.parquet');

-- Overview of the Parquet file contents (or: instance).
--
-- SQL syntax:
--
--   SUMMARIZE ‹query›
--   SUMMARIZE ‹table›
--
-- Provide a summary of the result of ‹query› (or the contents of ‹table›),
-- one row per column:
-- - column type
-- - min/max/distinct/avg value statistics
-- - standard deivation, 25%/50%/75% quartiles
-- - row count
-- - % of NULL values

SUMMARIZE
FROM 'taxi/nyc-yellow-cabs-2019-04.parquet';

-- Metadata at the file level (# rows, # row groups, Parquet version)
-- (=> num_rows // num_row_groups ≈ 64K rows per row group)
FROM parquet_file_metadata('taxi/nyc-yellow-cabs-2019-04.parquet');

-- Metadata at the row group level (row groups 0, 1 only)
SELECT row_group_id, row_group_num_rows, row_group_num_columns, row_group_bytes,
       path_in_schema, type, stats_min, stats_max, data_page_offset,
       compression, encodings, total_compressed_size, total_uncompressed_size
FROM   parquet_metadata('taxi/nyc-yellow-cabs-2019-04.parquet')
WHERE  row_group_id < 2;

-- Parquet compression and type storage saves spaces if compared to CSV.
--
-- Copy Parquet file contents into a CSV file:
COPY (FROM 'taxi/nyc-yellow-cabs-2019-04.parquet')
TO   'taxi/nyc-yellow-cabs-2019-04.csv';

-- Check size (and line count) of resulting CSV file
.shell ls -lh taxi/nyc-yellow-cabs-2019-04.*
.shell wc -l taxi/nyc-yellow-cabs-2019-04.csv
