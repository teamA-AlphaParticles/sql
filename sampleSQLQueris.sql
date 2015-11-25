--Sample Queries for the android app
--Select * from Account;
--Select * from Stock;

--Select ticker from Stock where weekPercentChange < 0;
--Select userID, password from Account where isAdmin = TRUE;

--Select ticker,  (currentPrice - buyPrice)*sharesOwned as totalDollarChange
--from Stock;

Select ticker, password
from Account, Stock where Account.userID = Stock.sector AND password = 'boopower';
