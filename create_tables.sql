/* 
Investment Portfolio Tracking Database
Creates the database and relational tables with primary and foreign keys
*/

CREATE DATABASE InvestmentTracker;
GO

USE InvestmentTracker;
GO

-- Investors table
CREATE TABLE Investors (
    investor_id INT IDENTITY(1,1) PRIMARY KEY,
    investor_name VARCHAR(120) NOT NULL,
    risk_profile VARCHAR(30) NOT NULL
);

-- Portfolios table
CREATE TABLE Portfolios (
    portfolio_id INT IDENTITY(1,1) PRIMARY KEY,
    investor_id INT NOT NULL,
    portfolio_name VARCHAR(120) NOT NULL,
    strategy VARCHAR(60) NOT NULL,
    CONSTRAINT FK_Portfolios_Investors
        FOREIGN KEY (investor_id)
        REFERENCES Investors(investor_id)
);

-- Assets table
CREATE TABLE Assets (
    asset_id INT IDENTITY(1,1) PRIMARY KEY,
    asset_symbol VARCHAR(15) NOT NULL,
    asset_type VARCHAR(30) NOT NULL,
    sector VARCHAR(60)
);

-- Brokers table
CREATE TABLE Brokers (
    broker_id INT IDENTITY(1,1) PRIMARY KEY,
    broker_name VARCHAR(100) NOT NULL,
    platform VARCHAR(60) NOT NULL
);

-- Trades table
CREATE TABLE Trades (
    trade_id INT IDENTITY(1,1) PRIMARY KEY,
    portfolio_id INT NOT NULL,
    asset_id INT NOT NULL,
    broker_id INT NOT NULL,
    trade_date DATE NOT NULL,
    trade_type VARCHAR(10) NOT NULL,
    quantity DECIMAL(12,2) NOT NULL,
    price DECIMAL(12,2) NOT NULL,

    CONSTRAINT FK_Trades_Portfolios
        FOREIGN KEY (portfolio_id)
        REFERENCES Portfolios(portfolio_id),

    CONSTRAINT FK_Trades_Assets
        FOREIGN KEY (asset_id)
        REFERENCES Assets(asset_id),

    CONSTRAINT FK_Trades_Brokers
        FOREIGN KEY (broker_id)
        REFERENCES Brokers(broker_id),

    CONSTRAINT CK_Trade_Type
        CHECK (trade_type IN ('BUY','SELL'))
);