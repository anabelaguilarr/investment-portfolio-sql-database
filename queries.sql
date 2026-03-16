/*
SQL analysis queries demonstrating database functionality
*/

USE InvestmentTracker;
GO

-- Query 1: Multi-table JOIN showing full trade information
SELECT 
    i.investor_name,
    p.portfolio_name,
    a.asset_symbol,
    b.broker_name,
    t.trade_type,
    t.quantity,
    t.price,
    t.trade_date
FROM Trades t
JOIN Portfolios p ON t.portfolio_id = p.portfolio_id
JOIN Investors i ON p.investor_id = i.investor_id
JOIN Assets a ON t.asset_id = a.asset_id
JOIN Brokers b ON t.broker_id = b.broker_id
ORDER BY t.trade_date DESC;

-- Query 2: Count trades by investor
SELECT 
    i.investor_name,
    COUNT(t.trade_id) AS total_trades
FROM Investors i
JOIN Portfolios p ON i.investor_id = p.investor_id
JOIN Trades t ON p.portfolio_id = t.portfolio_id
GROUP BY i.investor_name
ORDER BY total_trades DESC;

-- Query 3: Filter BUY trades and sort by date
SELECT 
    trade_id,
    trade_date,
    trade_type,
    quantity,
    price
FROM Trades
WHERE trade_type = 'BUY'
ORDER BY trade_date DESC;

-- Query 4: Net invested amount by portfolio
SELECT 
    p.portfolio_name,
    SUM(
        CASE 
            WHEN t.trade_type = 'BUY' THEN t.quantity * t.price
            ELSE -1 * t.quantity * t.price
        END
    ) AS net_invested_amount
FROM Portfolios p
JOIN Trades t ON p.portfolio_id = t.portfolio_id
GROUP BY p.portfolio_name
ORDER BY net_invested_amount DESC;

-- Query 5: Trading activity by asset type
SELECT 
    a.asset_type,
    COUNT(t.trade_id) AS number_of_trades,
    SUM(t.quantity * t.price) AS total_trade_value
FROM Assets a
JOIN Trades t ON a.asset_id = t.asset_id
GROUP BY a.asset_type
ORDER BY total_trade_value DESC;

-- Query 6: Trades executed through a selected broker
SELECT 
    b.broker_name,
    a.asset_symbol,
    t.trade_type,
    t.quantity,
    t.price,
    t.trade_date
FROM Trades t
JOIN Brokers b ON t.broker_id = b.broker_id
JOIN Assets a ON t.asset_id = a.asset_id
WHERE b.broker_name = 'NorthBridge Brokerage'
ORDER BY t.trade_date;