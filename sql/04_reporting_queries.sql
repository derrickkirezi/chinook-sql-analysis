-- Reporting Queries
-- Purpose: Generate clean, report-ready tables and insights

USE Chinook;

-- 1. Monthly revenue trend
SELECT 
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS Month,
    SUM(Total) AS MonthlyRevenue
FROM invoices
GROUP BY DATE_FORMAT(InvoiceDate, '%Y-%m')
ORDER BY Month;

-- 2. Top 10 customers (report-friendly)
SELECT
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    c.Country,
    SUM(i.Total) AS TotalRevenue
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY CustomerName, c.Country
ORDER BY TotalRevenue DESC
LIMIT 10;

-- 3. Revenue by genre
SELECT 
    g.Name AS Genre,
    SUM(il.UnitPrice * il.Quantity) AS GenreRevenue
FROM genres g
JOIN tracks t ON g.GenreId = t.GenreId
JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY g.Name
ORDER BY GenreRevenue DESC;

-- 4. Average invoice value by country
SELECT 
    BillingCountry,
    ROUND(AVG(Total), 2) AS AvgInvoiceValue
FROM invoices
GROUP BY BillingCountry
ORDER BY AvgInvoiceValue DESC;
