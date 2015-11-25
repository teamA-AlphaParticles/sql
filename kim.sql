--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author Andrew Groenewold and Moses Mangunrahardja
-- @version fall, 2015
--

--Create Database KIM

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS Stock;
DROP TABLE IF EXISTS Account;

-- Create the schema.
CREATE TABLE Account (
	id int,
	userID varchar(50) PRIMARY KEY, 
	password varchar(50) NOT NULL,
	isAdmin BOOLEAN
	);

CREATE TABLE Stock (
	ticker varchar(10) PRIMARY KEY, 
	sector varchar(50) REFERENCES Account(userID),
	buyPrice FLOAT,
	currentPrice FLOAT,
	targetPrice FLOAT,
	weekPercentChange FLOAT,
	sharesOwned int
	);


-- Allow users to select data from the tables.
GRANT SELECT ON Stock TO PUBLIC;
GRANT SELECT ON Account TO PUBLIC;

-- Add sample records.
INSERT INTO Account VALUES (1, 'Materials', 'materials123', FALSE);
INSERT INTO Account VALUES (2, 'MaterialsAdmin', 'admin', TRUE);
INSERT INTO Account VALUES (3, 'Macro', 'thisIsMe', FALSE);
INSERT INTO Account VALUES (4, 'Energy', 'boopower', FALSE);
INSERT INTO Account VALUES (5, 'Healthcare', 'boopower', FALSE);

INSERT INTO Stock VALUES ('THOR','Healthcare', 32, 50, 70, 0.01, 300);
INSERT INTO Stock VALUES ('IOSP','Materials', 37, 48, 52, 0.04, 200);
INSERT INTO Stock VALUES ('KWR','Materials', 27, 40, 47, 0.07, 500);
INSERT INTO Stock VALUES ('CJES','Energy', 20, 18, 30, -0.05, 270);

