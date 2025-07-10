--------------------------------------------------------------------------------
-- Tabular Database Systems
-- Assignment 05
-- Exercise 02
--------------------------------------------------------------------------------
-- In this exercise, we will explore aggregate functions in SQL. However, you
-- will have to "reverse engineer" the SQL query Q to create a table that
-- produces the results given below when Q is executed.
-- Query Q below involves various aggregate functions, including COUNT, MAX,
-- MIN, MEDIAN, and LIST. You will also need to consider the handling of
-- NULL values, the use of FILTER clauses, and the ordering of results
-- (i.e., ORDER BY within the aggregate function) .
--------------------------------------------------------------------------------
-- Task (a) — [E]
--------------------------------------------------------------------------------
-- Please define a table `t` that leads to the given result when you evaluate
-- the aggregation query Q below.
-- Query Q is:

SELECT count(*)                      AS c1,
       count(a)                      AS c2,
       count(b)                      AS c3,
       count(a) FILTER (a < 5)       AS c4,
       median(a)                     AS c5,
       max(a)                        AS c6,
       min(a)                        AS c7,
       list(b ORDER BY a NULLS LAST) AS c8,
       arg_max(a,b)                  AS c9
FROM t;  -- table t is to be defined by you

-- The expected result is:

-- ┌───────┬───────┬───────┬───────┬────────┬───────┬───────┬─────────────────────────────┬───────┐
-- │  c1   │  c2   │  c3   │  c4   │   c5   │  c6   │  c7   │             c8              │  c9   │
-- │ int64 │ int64 │ int64 │ int64 │ double │ int32 │ int32 │          varchar[]          │ int32 │
-- ├───────┼───────┼───────┼───────┼────────┼───────┼───────┼─────────────────────────────┼───────┤
-- │   7   │   6   │   5   │   3   │  5.0   │  10   │   1   │ [c, NULL, a, f, NULL, d, b] │   6   │
-- └───────┴───────┴───────┴───────┴────────┴───────┴───────┴─────────────────────────────┴───────┘
--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
