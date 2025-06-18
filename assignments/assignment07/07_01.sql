--------------------------------------------------------------------------------
-- Tabular Database Systems
-- Assignment 07
-- Exercise 01
--------------------------------------------------------------------------------
-- In this exercise, we will explore the columnar table storage format of DuckDB.
--
--------------------------------------------------------------------------------
-- Task (a)
--------------------------------------------------------------------------------
-- In the last assignment, we created a table lineitem from the TPC-H
-- benchmark data. We saw that the storage size of this table
-- shrunk from about 720 MB to about 160 MB when we used the
-- default compression scheme of DuckDB.
--
-- Please recreate the table lineitem from the TPC-H benchmark data
-- if you do not have it already. Then, check which compression
-- scheme is used for the columns of this table. You can use the
-- following query to check the compression scheme for the columns
-- of the table lineitem:
SELECT row_group_id,
       column_name, column_id,
       segment_type, segment_id,
       start, count,
       compression,
       stats,
       persistent
FROM   pragma_storage_info('t')
WHERE  segment_type <> 'VALIDITY'
ORDER BY row_group_id, segment_id;

-- Please report the compression scheme used for the columns
-- - l_orderkey
-- - l_quantity
-- - l_returnflag
-- - l_shipmode
-- - l_comment
--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
-- Task (b) i.
--------------------------------------------------------------------------------
-- Similar to file 023-compression.sql, create a database compressed.db
-- with table t with 180K rows (you can use the range()/generate_series() function)
-- and add the following columns:
-- - a text column with a common prefix `sha256('salt')` and a
--   unique suffix for each row, e.g. `sha256(i :: text)`
-- - a column of with random double values (you can use the random() function)
-- - a column with alternating boolean values (you can use the modulo operator %)
--
-- Then, check the size of the database compressed.db, and the compression
-- scheme used for the columns of table t. Please try to find an explanation
-- for the compression scheme used for each column.
--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
-- Task (b) ii.
--------------------------------------------------------------------------------
-- Now
-- Copy table t from compressed to uncompressed database uncompressed.db.
-- Use `PRAGMA force_compression = 'Uncompressed'` to force no compression
-- in the uncompressed database.
--
-- Then, check the size of the database uncompressed.db, and the compression
-- scheme used for the columns of table t (which should now be uncompressed).
-- You can use the same queries as above.
--
-- Please report the database size of uncompressed.db
--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
