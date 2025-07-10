--------------------------------------------------------------------------------
-- Tabular Database Systems
-- Assignment 01
-- Exercise 02
--------------------------------------------------------------------------------

-- Imagine you want to plan the chore chart of your living community using an
-- RDBMS. The chart is expected to provide an assignment of the services
-- {TRASH, KITCHEN, BATHROOM} to the flatmates {Annika, Pierre, Leonie} on a
-- weekly basis. The relational model implies that your chart is represented in
-- a tabular form. Here are three possible variants of a CHART relation:

-- ┌────────┐
-- │ CHART1 │
-- ├────────┼─────────────────┬────────┬──────────┐
-- │ week   │ Annika          │ Pierre │ Leonie   │
-- ├────────┼─────────────────┼────────┼──────────┤
-- │ 49     │ TRASH & KITCHEN │ null   │ BATHROOM │
-- │ 50     │ BATHROOM        │ TRASH  │ KITCHEN  │
-- └────────┴─────────────────┴────────┴──────────┘

-- ┌────────┐
-- │ CHART2 │
-- ├────────┼────────┬─────────┬──────────┐
-- │ week   │ TRASH  │ KITCHEN │ BATHROOM │
-- ├────────┼────────┼─────────┼──────────┤
-- │ 49     │ Annika │ Annika  │ Leonie   │
-- │ 50     │ Pierre │ Leonie  │ Annika   │
-- └────────┴────────┴─────────┴──────────┘

-- ┌────────┐
-- │ CHART3 │
-- ├────────┼──────────┬──────────┐
-- │ week   │ flatmate │ service  │
-- ├────────┼──────────┼──────────┤
-- │ 49     │ Annika   │ TRASH    │
-- │ 49     │ Annika   │ KITCHEN  │
-- │ 49     │ Leonie   │ BATHROOM │
-- │ 50     │ Annika   │ BATHROOM │
-- │ 50     │ Pierre   │ TRASH    │
-- │ 50     │ Leonie   │ KITCHEN  │
-- └────────┴──────────┴──────────┘

--------------------------------------------------------------------------------
-- Task (a) — [E]
--------------------------------------------------------------------------------
-- For each of the three variants, write down the SQL DDL statements to
-- create the table and the SQL DML statements to insert the data. You can
-- assume that the week is represented as an integer and the flatmates are
-- represented as text values.
--
-- For each of the three variants, add appropriate constraints to the
-- relation schema, e.g., NOT NULL, UNIQUE, CHECK, PRIMARY KEY, etc.,
-- and explain your choices.
--------------------------------------------------------------------------------
-- Solution:
-- CREATE TABLE CHART1 ( ⟨your solution⟩ );

-- CREATE TABLE CHART2 ( ⟨your solution⟩ );

-- CREATE TABLE CHART3 ( ⟨your solution⟩ );

--------------------------------------------------------------------------------
-- Task (b) — [E]
--------------------------------------------------------------------------------
-- Explain what changes to the schema and/or instance are needed for every
-- table, if we want to:
-- i. Add the plan for week 51 (Annika: KITCHEN, Pierre: BATHROOM, Leonie: TRASH).
-- ii. Add an additional service COOK for Pierre in week 50.
-- iii. Switch Leonie with a new flatmate Adrian.
--
-- Note: You can assume, that there are no entries for week 51 in the tables.
--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
-- Task (c) — [E]
--------------------------------------------------------------------------------
-- Specify INSERT, UPDATE, and DELETE statements for those tables in task
-- i. to iii. that only need their instance changed.
--
-- Hint: For i., a simple INSERT statement is sufficient. However, for ii. there
-- already exists a row for week 50 in the instance of CHART1. You need to
-- update this row.
-- Task iii. requires you to rename a column using the ALTER TABLE statement.
-- https://duckdb.org/docs/stable/sql/statements/alter_table#rename-column
-- https://duckdb.org/docs/stable/sql/statements/insert
-- https://duckdb.org/docs/stable/sql/statements/update
--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
-- Task (d) — [E]
--------------------------------------------------------------------------------
-- In the relational model, relation schemas are assumed to be stable while
-- instances change frequently. Given this, which relation is the best choice to
-- represent the chart? Why?
--------------------------------------------------------------------------------
-- Solution:
