--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author Andrew Groenewold and Moses Mangunrahardja
-- @version fall, 2015
--

Create Database KIM
Go

Use KIM
Go

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.

-- Create the schema.


CREATE TABLE Account (
	userID varchar(50) PRIMARY KEY, 
	[password] varchar(50) NOT NULL,
	isAdmin Bit
	);

CREATE TABLE Stock (
	ticker varchar(10) PRIMARY KEY, 
	sector varchar(50) REFERENCES Account(userID),
	buyPrice FLOAT,
	currentPrice FLOAT,
	targetPrice FLOAT,
	weekPercentChange FLOAT,
	sharesOwned int,
	);


-- Allow users to select data from the tables.
GRANT SELECT ON Stock TO PUBLIC;
GRANT SELECT ON Account TO PUBLIC;

-- Add sample records.
INSERT INTO Account VALUES ('Materials', 'materials123', 0);
INSERT INTO Account VALUES ('MaterialsAdmin', 'admin', 1);
INSERT INTO Account VALUES ('Macro', 'thisIsMe', 0);
INSERT INTO Account VALUES ('Energy', 'boopower', 0);
INSERT INTO Account VALUES ('Healthcare', 'boopower', 0);
GO

INSERT INTO Stock VALUES ('THOR','Healthcare', 32, 50, 70, 0.01, 300);
INSERT INTO Stock VALUES ('IOSP','Materials', 37, 48, 52, 0.04, 200);
INSERT INTO Stock VALUES ('KWR','Materials', 27, 40, 47, 0.07, 500);
INSERT INTO Stock VALUES ('CJES','Energy', 20, 18, 30, -0.05, 270);
GO

--Sample Query for the android app
Select * from Account
Select * from Stock

Select ticker from Stock where weekPercentChange < 0;
Select userID, password from Account where isAdmin = 1;

Select ticker,  (currentPrice - buyPrice)*sharesOwned as totalDollarChange
from Stock

Select ticker, password
from Account, Stock where Account.userID = Stock.sector AND password = 'boopower'


--Cleanup
Drop table Stock
Drop table Account
Use master
Drop Database KIM
