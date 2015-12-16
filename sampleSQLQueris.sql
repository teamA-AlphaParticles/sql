--
-- sampleSQLQueris.sql contains several sample queries to demonstrate
-- how to use the kimSQL database.
--
-- @author Andrew Groenewold and Moses Mangunrahardja
-- @version fall, 2015
--
--Select everything in the database
--Select * from Account;
--Select * from Stock;


--Choose only the expensive stocks
--Select ticker from Stock where buyPrice > 50;

--Choose all the credentials with admin rights
--Select userID, password from Account where isAdmin = TRUE;


--Select all the stocks from the same sector as the account with 'boopower' as its password
Select ticker
from Account, Stock where Account.userID = Stock.sector AND password = 'boopower';
