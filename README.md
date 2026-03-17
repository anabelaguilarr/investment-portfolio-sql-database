# Investment Portfolio SQL Database
## Overview

This project is a relational database system built in Microsoft SQL Server to track investment activity across investors, portfolios, financial assets, brokers, and trades.

The goal of the project was to design a normalized SQL database that supports portfolio tracking and analytical reporting using structured relational data.

## Business Problem

Investment firms and analysts need a reliable way to store and analyze portfolio activity. This database models a simplified investment tracking environment where multiple investors own portfolios, portfolios contain trades, and each trade is linked to an asset and broker.

## Database Design

The schema includes five relational tables:

Investors - stores investor information and risk profile

Portfolios - stores portfolio records linked to investors

Assets - stores financial instruments such as stocks, ETFs, and crypto

Brokers - stores broker or platform information

Trades - stores buy/sell transactions linked to portfolios, assets, and brokers

## Key Features

Primary key and foreign key constraints

Normalized relational schema

Fictional but realistic sample investment data

Analytical SQL queries for reporting and portfolio insights

## SQL Files

sql/create_tables.sql - database and table creation

sql/insert_sample_data.sql - sample fictional data inserts

sql/queries.sql - analytical SQL queries

## Example Analyses

The project includes queries for:

* multi-table joins across portfolios, investors, assets, and brokers

* trade counts by investor

* filtering and sorting of transactions

* net invested amount by portfolio

* trade activity by asset type

* broker-specific trade analysis

## ER Diagram

The ER diagram for the database is included in the diagrams folder.

## Video Walkthrough

A walkthrough of the schema, sample data, and SQL queries is available here:

YouTube Video: https://youtu.be/iklH3WqjJl0?si=2tavxdxafHvuHALn

## Skills Demonstrated

* SQL Server

* Relational database design

* Primary and foreign key implementation

* Data normalization

* Query writing with JOIN, GROUP BY, WHERE, and ORDER BY

* Translating a business use case into a relational schema
