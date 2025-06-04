--------------------------------------------------------------------------------
-- Tabular Database Systems
-- Assignment 06
-- Exercise 01
--------------------------------------------------------------------------------
-- In this exercise, we will explore DuckDB database files a bit.
--
-- Please download the TPC-H table `lineitem` from the following URL:
-- https://db.cs.uni-tuebingen.de/staticfiles/lineitem.csv
-- You propably already have this file from the previous assignments.
--------------------------------------------------------------------------------
-- Task (a)
--------------------------------------------------------------------------------
-- i. Please create a DuckDB database file `lineitem.db` that only contains the
-- TPC-H table `lineitem`. Hand-in the SQL code that you used to create the
-- database file.
-- Note: You may want to use the following snippet in your SQL statement:
-- read_csv('lineitem.csv',
--           header = false,
--           names = ['l_orderkey', 'l_partkey', 'l_suppkey', 'l_linenumber', 'l_quantity',
--                    'l_extendedprice', 'l_discount', 'l_tax', 'l_returnflag',
--                    'l_linestatus', 'l_shipdate', 'l_commitdate', 'l_receiptdate',
--                    'l_shipinstruct', 'l_shipmode', 'l_comment'])
-- Otherwise, your table will not have the correct column names.
-- Note: Do not add this file to your git repository, as it is too large.
--
-- ii. Files `lineitem.csv` and `lineitem.db` are vastly different in size.
--    Why is that? Please try to come up with a brief explanation.
--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
-- Task (b)
--------------------------------------------------------------------------------
-- Please run the following SQL query while connected to the DuckDB database
-- `lineitem.db` that you created in Task (a).
-- For this task, use .timer on in DuckDB's CLI to measure the execution
-- time of the queries.
-- 1.
SELECT count(*)
FROM read_csv('lineitem.csv',
              header = false,
              names = ['l_orderkey', 'l_partkey', 'l_suppkey', 'l_linenumber', 'l_quantity',
                       'l_extendedprice', 'l_discount', 'l_tax', 'l_returnflag',
                       'l_linestatus', 'l_shipdate', 'l_commitdate', 'l_receiptdate',
                       'l_shipinstruct', 'l_shipmode', 'l_comment'])
WHERE (l_receiptdate <= '1995-06-17' AND l_returnflag <> 'A' AND l_returnflag <> 'R')
OR    (l_receiptdate > '1995-06-17'  AND l_returnflag <> 'N');

-- 2.
SELECT count(*)
FROM lineitem
WHERE (l_receiptdate <= '1995-06-17' AND l_returnflag <> 'A' AND l_returnflag <> 'R')
OR    (l_receiptdate > '1995-06-17'  AND l_returnflag <> 'N');

-- Both queries should return the same result, but they show different
-- performance characteristics. We want to investigate where the time is spent
-- in the two queries.
--
-- i. Please run the SQL queries above and report the execution time of
--    both queries.
-- ii. Please run the queries again, but this time with the `EXPLAIN ANALYZE`
--     prefix. For the first query, the output should be similar to:
-- ┌───────────────────────────┐
-- │           QUERY           │
-- └─────────────┬─────────────┘
-- ┌─────────────┴─────────────┐
-- │      EXPLAIN_ANALYZE      │
-- │    ────────────────────   │
-- │           0 Rows          │
-- │          (0.00s)          │
-- └─────────────┬─────────────┘
-- ┌─────────────┴─────────────┐
-- │    UNGROUPED_AGGREGATE    │
-- │    ────────────────────   │
-- │        Aggregates:        │
-- │        count_star()       │
-- │                           │
-- │           1 Rows          │
-- │          (0.00s)          │
-- └─────────────┬─────────────┘
-- ┌─────────────┴─────────────┐
-- │           FILTER          │
-- │    ────────────────────   │
-- │  (((l_receiptdate > '1995 │
-- │    -06-17'::DATE) AND     │
-- │ (l_returnflag != 'N')) OR │
-- │  ((l_receiptdate <= '1995 │
-- │    -06-17'::DATE) AND     │
-- │ (l_returnflag != 'A') AND │
-- │  (l_returnflag != 'R')))  │
-- │                           │
-- │           0 Rows          │
-- │          (0.08s)          │
-- └─────────────┬─────────────┘
-- ┌─────────────┴─────────────┐
-- │         TABLE_SCAN        │
-- │    ────────────────────   │
-- │     Function: READ_CSV    │
-- │                           │
-- │        Projections:       │
-- │       l_receiptdate       │
-- │        l_returnflag       │
-- │                           │
-- │        6001215 Rows       │
-- │          (3.75s)          │
-- └───────────────────────────┘

-- Please hand-in the output for the both queries.
-- iii. Please explain the performance difference between the two queries
--     based on the output of the `EXPLAIN ANALYZE` command.
--     What is the reason for the performance difference?
--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
-- Task (c)
--------------------------------------------------------------------------------
-- Did we really save time by creating the DuckDB table `lineitem` in Task (b),
-- or could we always just use the CSV file directly?
-- Please briefly explain your answer.
--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
