--------------------------------------------------------------------------------
-- Tabular Database Systems
-- Assignment 02
-- Exercise 03
--------------------------------------------------------------------------------

-- Tables can be used to store basically arbitrary data. In the lecture, we
-- discussed how a state machine can be represented as tables. In this
-- exercise, we will represent a directed graph using a table:

CREATE TABLE nodes (
    id INTEGER NOT NULL PRIMARY KEY
);

CREATE TABLE edges (
    source INTEGER NOT NULL REFERENCES nodes(id),
    target INTEGER NOT NULL REFERENCES nodes(id),
    PRIMARY KEY (source, target)
);

-- The tables contain the following data:
INSERT INTO nodes (id) VALUES
    (1),
    (2),
    (3),
    (4),
    (5);

INSERT INTO edges (source, target) VALUES
    (1, 2),
    (1, 3),
    (3, 4),
    (4, 5);

-- The graph can be visualized as follows:
-- 1 → 2
-- ↓
-- 3 → 4 → 5

--------------------------------------------------------------------------------
-- Task (a) — [E]
--------------------------------------------------------------------------------
-- Why would it be a bad idea to use a single table to store the graph? What are
-- the advantages of using two tables?
-- CREATE TABLE graph (
--     id INTEGER NOT NULL PRIMARY KEY,
--     source INTEGER NOT NULL REFERENCES graph(id),
--     target INTEGER NOT NULL REFERENCES graph(id)
-- );
--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
-- Task (b) — [E]
--------------------------------------------------------------------------------
-- We want to delete the node with id 3 from the graph, without
-- deleting nodes 4 and 5. This will effectively split the graph into two
-- disconnected components. Write the SQL DML statement to delete the node
-- with id 3 from the graph. Remember that you have to delete the
-- corresponding edges before you can delete the node.

--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
-- Task (c) — [E]
--------------------------------------------------------------------------------
-- Write the SQL DML statement to add a new node with id 6 to the graph.
-- Please add edges from node 1 to node 6 and from node 6 to node 5.
-- Also add an edge from node 5 to node 6.
--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
-- Task (d) — [E]
--------------------------------------------------------------------------------
-- The graph is now cyclic. Please explain why this is not a problem in the
-- context of the graph representation we are using.
--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
-- Task (e) — [E]
--------------------------------------------------------------------------------
-- We now need to add text labels to the edges of the graph.
-- Propose a design for a new table labels that holds such edge labels.
-- Leave the existing tables intact. Make sure to add appropriate primary and
-- foreign keys to table labels.
--
-- Once you have created table `labels`, attach label 'X' to edge 5->6
-- and label 'Y' to edge 6->5 using SQL DML statements.
--------------------------------------------------------------------------------
-- Solution:

--------------------------------------------------------------------------------
