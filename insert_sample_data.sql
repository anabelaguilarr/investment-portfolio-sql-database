/*
Insert fictional sample data into all tables
*/

USE InvestmentTracker;
GO

-- Investors
INSERT INTO Investors (investor_name, risk_profile)
VALUES
('Anabel Aguilar','Moderate'),
('Arturo Ramirez','Aggressive'),
('Omer Berk','Conservative');

-- Portfolios
INSERT INTO Portfolios (investor_id, portfolio_name, strategy)
VALUES
(1,'Core Growth','Long-Term Growth'),
(1,'Dividend Focus','Income'),
(2,'High Risk Tech','Speculation'),
(3,'Capital Preservation','Low Volatility');

-- Assets
INSERT INTO Assets (asset_symbol, asset_type, sector)
VALUES
('AAPL','Stock','Technology'),
('VOO','ETF','Index'),
('MSFT','Stock','Technology'),
('TSLA','Stock','Consumer Discretionary'),
('BTC','Crypto',NULL);

-- Brokers
INSERT INTO Brokers (broker_name, platform)
VALUES
('NorthBridge Brokerage','Web'),
('Skyline Trading','Mobile'),
('Atlas Securities','Web');

-- Trades
INSERT INTO Trades
(portfolio_id, asset_id, broker_id, trade_date, trade_type, quantity, price)
VALUES
(1,1,1,'2026-02-01','BUY',10,180.50),
(1,2,1,'2026-02-03','BUY',5,475.10),
(2,3,2,'2026-02-05','BUY',8,412.25),
(3,4,3,'2026-02-08','BUY',3,225.75),
(1,1,1,'2026-02-10','SELL',2,190.00),
(4,2,2,'2026-02-12','BUY',4,470.00),
(2,5,3,'2026-02-14','BUY',0.50,48000.00);