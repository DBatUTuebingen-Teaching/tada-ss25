-- Create the tables for beer/bar database
-- (also available as a DuckDB database file)

-- Bars table - stores information about bars
CREATE OR REPLACE TABLE Bars (
    id int PRIMARY KEY,
    name text,
    address text,
    license_number text
);

-- Beers table - stores information about different beers
CREATE OR REPLACE TABLE Beers (
    id int PRIMARY KEY,
    name text,
    manufacturer text,
    alcoholContent decimal(3,1),
    type text
);

-- Drinkers table - stores information about customers
CREATE OR REPLACE TABLE Drinkers (
    id int PRIMARY KEY,
    name text,
    age int,
    address text
);

-- Likes table - stores which drinkers like which beers
CREATE OR REPLACE TABLE Likes (
    drinker_id int,
    beer_id int,
    FOREIGN KEY (drinker_id) REFERENCES Drinkers(id),
    FOREIGN KEY (beer_id) REFERENCES Beers(id)
);

-- Sells table - stores which bars sell which beers and their prices
CREATE OR REPLACE TABLE Sells (
    bar_id int,
    beer_id int,
    price decimal(5,2),
    FOREIGN KEY (bar_id) REFERENCES Bars(id),
    FOREIGN KEY (beer_id) REFERENCES Beers(id)
);

-- Frequents table - stores which drinkers visit which bars
CREATE OR REPLACE TABLE Frequents (
    drinker_id int,
    bar_id int,
    FOREIGN KEY (drinker_id) REFERENCES Drinkers(id),
    FOREIGN KEY (bar_id) REFERENCES Bars(id)
);

INSERT INTO Bars (id, name, address, license_number) VALUES
(1, 'The Hoppy Place', '123 Brew St', 'LIC123'),
(2, 'Barley & Hops', '456 Ale Ave', 'LIC456'),
(3, 'The Pint House', '789 Lager Ln', 'LIC789'),
(4, 'Crafty Brews', '321 Stout St', 'LIC321'),
(5, 'Brewed Awakening', '654 IPA Blvd', 'LIC654'),
(6, 'The Beer Garden', '987 Wheat Way', 'LIC987'),
(7, 'Ale House', '159 Porter Pl', 'LIC159'),
(8, 'Stout & Barrel', '753 Cider Cir', 'LIC753'),
(9, 'The Keg Stand', '852 Lager Loop', 'LIC852'),
(10, 'Hops & Dreams', '369 Brew Blvd', 'LIC369'),
(11, 'The Golden Tap', '147 Ale Alley', 'LIC147'),
(12, 'Brewtopia', '258 Stout Street', 'LIC258'),
(13, 'The Craft Cellar', '369 Wheat Way', 'LIC369'),
(14, 'Hoppy Haven', '741 Porter Place', 'LIC741'),
(15, 'Barrel & Brew', '852 Cider Circle', 'LIC852');

INSERT INTO Beers (id, name, manufacturer, alcoholContent, type) VALUES
(1, 'Hoppy IPA', 'Brewery A', 6.5, 'IPA'),
(2, 'Golden Lager', 'Brewery B', 5.0, 'Lager'),
(3, 'Dark Stout', 'Brewery C', 7.0, 'Stout'),
(4, 'Wheat Ale', 'Brewery D', 5.5, 'Ale'),
(5, 'Amber Ale', 'Brewery E', 6.0, 'Ale'),
(6, 'Pale Ale', 'Brewery F', 5.8, 'Ale'),
(7, 'Cider Bliss', 'Brewery G', 4.5, 'Cider'),
(8, 'Porter Delight', 'Brewery H', 6.2, 'Porter'),
(9, 'Session IPA', 'Brewery I', 4.0, 'IPA'),
(10, 'Barleywine Special', 'Brewery J', 10.0, 'Barleywine'),
(11, 'Belgian Tripel', 'Brewery K', 8.5, 'Belgian'),
(12, 'Sour Ale', 'Brewery L', 5.2, 'Ale'),
(13, 'Brown Ale', 'Brewery M', 5.6, 'Ale'),
(14, 'Fruit Beer', 'Brewery N', 4.8, 'Fruit'),
(15, 'Smoked Porter', 'Brewery O', 7.5, 'Smoked Porter');

INSERT INTO Drinkers (id, name, age, address) VALUES
(1, 'Alice', 28, '101 Main St'),
(2, 'Bob', 34, '202 Elm St'),
(3, 'Charlie', 22, '303 Oak St'),
(4, 'Diana', 30, '404 Pine St'),
(5, 'Ethan', 26, '505 Maple St'),
(6, 'Fiona', 29, '606 Cedar St'),
(7, 'George', 31, '707 Birch St'),
(8, 'Hannah', 27, '808 Spruce St'),
(9, 'Ian', 35, '909 Willow St'),
(10, 'Jasmine', 24, '1000 Cherry St');

INSERT INTO Likes (drinker_id, beer_id) VALUES
(1, 1), (1, 3), (2, 2), (2, 4), (3, 5), (3, 6),
(3, 12), (4, 7), (4, 8), (5, 9), (5, 10), (6, 1),
(6, 2), (7, 3), (7, 4), (8, 5), (8, 6), (9, 7),
(9, 8), (10, 9), (10, 10);

INSERT INTO Sells (bar_id, beer_id, price) VALUES
(1, 1, 5.00), (1, 2, 4.50), (2, 3, 6.00), (2, 4, 5.50),
(3, 5, 5.75), (3, 6, 4.75), (4, 7, 6.25), (4, 8, 7.00),
(5, 9, 4.00), (5, 10, 8.50), (6, 1, 5.25), (6, 2, 4.75),
(7, 3, 6.50), (7, 4, 5.25), (8, 5, 6.00), (8, 6, 5.00),
(9, 7, 4.50), (9, 8, 6.75), (10, 9, 3.75), (10, 10, 9.00);

INSERT INTO Frequents (drinker_id, bar_id) VALUES
(1, 1), (1, 2), (2, 3), (2, 4), (3, 5), (3, 6),
(4, 7), (4, 8), (5, 9), (5, 10), (6, 1), (6, 2),
(7, 3), (7, 4), (8, 5), (8, 6), (9, 7), (9, 8),
(10, 9), (10, 10);
