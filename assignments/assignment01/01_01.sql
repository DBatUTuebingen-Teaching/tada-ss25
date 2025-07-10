--------------------------------------------------------------------------------
-- Tabular Database Systems
-- Assignment 01
-- Exercise 01
--------------------------------------------------------------------------------

-- Given the following DuckDB output of table customers:
--
-- ┌────────┬────────────┬────────────┬────────────┬────────────┐
-- │ id     │ first_name │ last_name  │ email      │ phone      │
-- ├────────┼────────────┼────────────┼────────────┼────────────┤
-- │ 1      │ John       │ Doe        │ john@doe   │ 1234567890 │
-- │ 2      │ Jane       │ Smith      │ jane@smith │ 0987654321 │
-- │ 3      │ Alice      │ Johnson    │ NULL       │ NULL       │
-- │ 4      │ Bob        │ Brown      │ bob@brown  │ NULL       │
-- └────────┴────────────┴────────────┴────────────┴────────────┘

--------------------------------------------------------------------------------
-- Task (a) — [E]
--------------------------------------------------------------------------------
-- Write the SQL DDL statement to create the table customers. Use
-- appropriate data types for each column and add constraints to ensure
-- that the id is unique and not null, the first_name and last_name are
-- not null, and the email is unique. The phone number can be null.
-- https://duckdb.org/docs/stable/sql/statements/create_table
--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
-- Task (b) — [E]
--------------------------------------------------------------------------------
-- Write the SQL DML statement to insert the data shown in the
-- output into the customers table. Ensure that the data types match
-- the schema you defined in the DDL statement.
-- https://duckdb.org/docs/stable/sql/statements/insert

--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
-- Task (c) — [E]
--------------------------------------------------------------------------------
-- Write the SQL DML statement to update the email of the customer
-- with id 3 to "alice@johnson" and the phone number to "5551234567".
-- Ensure that the update is successful and the data is reflected in the
-- customers table.
-- https://duckdb.org/docs/stable/sql/statements/update

--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
-- Task (d) — [E]
--------------------------------------------------------------------------------
-- Write the SQL DML statement to delete the customer with id 4
-- from the customers table. Ensure that the deletion is successful.
-- https://duckdb.org/docs/stable/sql/statements/delete
--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
-- Task (e) — [E]
--------------------------------------------------------------------------------
-- Write a SQL query to select all customers from the customers
-- table where the first name starts with "J". You can use the LIKE operator
-- in the WHERE clause to filter the results: `WHERE first_name LIKE 'J%'`.
-- https://duckdb.org/docs/stable/sql/statements/select
--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
-- Want to check your solution?
-- Query `SELECT * FROM customers;` to see the current state of the table.
-- The output should match this:
-- ┌────────┬────────────┬────────────┬───────────────┬────────────┐
-- │ id     │ first_name │ last_name  │ email         │ phone      │
-- ├────────┼────────────┼────────────┼───────────────┼────────────┤
-- │ 1      │ John       │ Doe        │ john@doe      │ 1234567890 │
-- │ 2      │ Jane       │ Smith      │ jane@smith    │ 0987654321 │
-- │ 3      │ Alice      │ Johnson    │ alice@johnson │ 5551234567 │
-- └────────┴────────────┴────────────┴───────────────┴────────────┘
--------------------------------------------------------------------------------
