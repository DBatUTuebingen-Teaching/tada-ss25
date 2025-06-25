--------------------------------------------------------------------------------
-- Tabular Database Systems
-- Assignment 07
-- Exercise 02
--------------------------------------------------------------------------------
-- Task (a)
--------------------------------------------------------------------------------
-- In this exercise, we will try to explore the effect of compression
-- on the query performance of DuckDB.
--
-- Please create a database compressed.db with TPC-H data at scale factor
-- sf = 10. You can use DuckDB's tpch extension to obtain the required
-- TPCH-H tables (including table lineitem).
-- Note: This experiment requires about 15 GB of disk space.
-- You can use the following commands to create the database
-- and the table:
ATTACH 'compressed.db';
USE compressed;
INSTALL tpch;
LOAD tpch;
CALL dbgen(sf = 10);

-- Restart DuckDB to clear the memory cache.

-- Then, run the following query 3 times and report the execution times
-- (use .timer on in DuckDB's CLI to measure the execution time of the query):

-- TPC-H Query 6
select
        sum(l_extendedprice * l_discount) as revenue
from
        lineitem
where
        l_shipdate >= date '1994-01-01'
        and l_shipdate < date '1994-01-01' + interval '1' year
        and l_discount between 0.06 - 0.01 and 0.06 + 0.01
        and l_quantity < 24
;

-- Now, repeat the same query sequence on the uncompressed version of the
-- TPC-H data. You can use the following commands to create the uncompressed
-- database and the table:
ATTACH 'uncompressed.db';
USE uncompressed;
PRAGMA force_compression = 'Uncompressed';
COPY FROM DATABASE compressed TO uncompressed;

-- Restart DuckDB to clear the memory cache.

-- Then, run the same query 3 times and report the execution times.
--
-- i. Can you explain the differences in execution times between the
--    first and the subsequent two runs of the query? (Here, it suffices to
--    focus on either the compressed or uncompressed database.)
-- ii. Now compare the performance of the first query runs in the compressed
--     and uncompressed database. Try to explain the execution time difference.
--     Do the same for the second (and third) query runs. How do you explain
--     the execution time differences now?
-- iii. Assuming that the overall query execution time is slightly worse
--      for the compressed database, would you still prefer the compressed
--      version over the uncompressed version? Why or why not?
--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
