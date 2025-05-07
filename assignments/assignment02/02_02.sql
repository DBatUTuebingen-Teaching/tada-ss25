--------------------------------------------------------------------------------
-- Tabular Database Systems
-- Assignment 02
-- Exercise 02
--------------------------------------------------------------------------------

-- DuckDB provides a very powerful CSV import functionality saving you from
-- a lot of headache when it comes to loading data from CSV files—or writing
-- data to CSV files:
-- https://duckdb.org/docs/stable/data/csv/overview

-- File `broken.csv` contains some CSV data that you want to query
-- using DuckDB. However, the file is broken and cannot be loaded directly:

FROM read_csv('broken.csv');
-- ┌─────────┬─────────┬─────────┐
-- │ column0 │ column1 │ column2 │
-- │  int64  │ varchar │  int64  │
-- ├─────────┼─────────┼─────────┤
-- │    6    │ NULL    │   30    │
-- └─────────┴─────────┴─────────┘

-- Instead of six rows with columns {id, name, age}, the query returns a bogous
-- result. This can happen if the CSV file is not well-formed or if it contains
-- inconsistent data.

--------------------------------------------------------------------------------
-- Task (a)
--------------------------------------------------------------------------------
-- Please fix the CSV file `broken.csv` so that it can be loaded without any issues.
--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
