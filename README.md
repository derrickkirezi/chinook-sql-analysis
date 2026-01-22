# Chinook SQL Data Analysis Project

## Project Overview
This project analyzes the Chinook sample database, which represents a digital music store. 
The objective is to explore relational data, assess data quality, and generate summary reports using SQL.

## Dataset
- Data includes customers, invoices, tracks, albums, and artists.
- Chinook Sample Database (MySQL)
- Publicly available sample database
- Data includes customers, invoices, tracks, albums, and artists.
- Source: https://github.com/lerocha/chinook-database


## Tools Used
- MySQL
- SQL
- MySQL Workbench

## Project Structure
- `sql/` – SQL scripts used for analysis
  - `01_database_overview.sql` – Database structure and relationship exploration
  - `02_data_quality_checks.sql` – Checking data quality 

## Progress
- ✅ Step 1: Database overview and relationships completed
- ✅ Step 2: Data quality checks completed
  - All customers have invoices
  - All invoices have items
  - Some tracks have never been sold (low demand)
  - All invoices have positive totals

- ⏳ Step 3: Sales and customer analysis (next)
