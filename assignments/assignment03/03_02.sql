--------------------------------------------------------------------------------
-- Tabular Database Systems
-- Assignment 03
-- Exercise 02
--------------------------------------------------------------------------------

-- The file `StarWars-EpisodeIV.txt` contains the script of the movie Star Wars: Episode IV - A New Hope.
-- The file is a space-separated file with three columns: `id`, `character`, and `dialogue`.
-- We have provided a SQL query that loads the file into DuckDB using the `read_csv` function:
FROM read_csv('StarWars-EpisodeIV.txt',
              header = false,
              names = ['id', 'character', 'dialogue'],
              delim = ' ');
--------------------------------------------------------------------------------
-- Task (a) — [E]
--------------------------------------------------------------------------------
-- Please load the file `StarWars-EpisodeIV.txt` into a DuckDB table using the `read_csv` function.
--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
-- Task (b) — [E]
--------------------------------------------------------------------------------
-- Please write a SQL query that returns only the last line of the script.
--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
-- Task (c) — [E]
--------------------------------------------------------------------------------
-- Please write a SQL that lists all characters who state that they have
-- "... a very bad feeling about this ..."
--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
-- Task (d) — [E]
--------------------------------------------------------------------------------
-- Please write a SQL query that returns the 10 longest lines of the script,
-- and keep it in the same order as the original file.
-- Note: https://duckdb.org/docs/stable/sql/functions/char
--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
-- Task (e) — [E]
--------------------------------------------------------------------------------
-- Please write a SQL query that returns the first 5 lines of the script
-- where the dialogue contains the word "force" (case insensitive),
-- and order them by the length of the dialogue in descending order.
--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
-- Task (f) — [E]
--------------------------------------------------------------------------------
-- Please write a SQL query that returns the dialogue lines where the character name
-- is either "BEN" or "VADER" talking about the "force" (case insensitive),
-- and display the following:
-- 1. The character name in uppercase
-- 2. The dialogue with all occurrences of "force" (case insensitive) replaced with "FORCE"
-- 3. Additionally, the first 20 characters of the original dialogue line
-- Order the results by the length of the character name, then by id.
--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
-- Task (g)
--------------------------------------------------------------------------------
-- We now want to use DuckDB as a data processing engine reading from a CSV file
-- and writing the results to a JSON file.
--
-- Please write a SQL query that reads the file `StarWars-EpisodeIV.txt` and
-- writes the dialogue lines of the character "THREEPIO" to a JSON file named `C3PO.json`.
-- The JSON file should contain an array of objects. Example:
-- [
--         {"id":1,"dialogue":"Did you hear that?  They've shut down the main reactor.  We'll be destroyed for sure.  This is madness!"},
--         {"id":2,"dialogue":"We're doomed!"},
--         {"id":3,"dialogue":"There'll be no escape for the Princess this time."},
--         {"id":4,"dialogue":"What's that?"},
--         {"id":5,"dialogue":"I should have known better than to trust the logic of a half-sized thermocapsulary dehousing assister..."},
--         {"id":7,"dialogue":"Artoo! Artoo-Detoo, where are you?"},
--         {"id":8,"dialogue":"At last!  Where have you been?"},
-- ...
-- ]
--
-- Note: use the `read_csv` function to read the file and the COPY command
-- to write the results to a JSON file. Remember to give the COPY command
-- the correct FORMAT options.
--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
