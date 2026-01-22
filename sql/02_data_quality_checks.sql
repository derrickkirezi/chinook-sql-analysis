-- Data Quality Checks
-- Purpose: Identify missing and inconsistent records
-- in the Chinook database

USE Chinook;

-- 1. Customers with no invoices
SELECT 
    c.CustomerId,
    c.FirstName,
    c.LastName
FROM customers c
LEFT JOIN invoices i 
    ON c.CustomerId = i.CustomerId
WHERE i.InvoiceId IS NULL;

-- 2. Invoices with no items
SELECT 
    i.InvoiceId,
    i.InvoiceDate,
    i.Total
FROM invoices i
LEFT JOIN InvoiceLine il
    ON i.InvoiceId = il.InvoiceId
WHERE il.InvoiceLineId IS NULL;

-- 3. Tracks that were never sold
SELECT 
    t.TrackId,
    t.Name
FROM tracks t
LEFT JOIN InvoiceLine il
    ON t.TrackId = il.TrackId
WHERE il.TrackId IS NULL;

-- 4. Invoices with zero or negative totals
SELECT 
    InvoiceId,
    Total
FROM invoices
WHERE Total <= 0;

-- DATA QUALITY CHECK RESULTS
-- 1. Customers with no invoices: None
-- 2. Invoices with no items: None
-- 3. Tracks never sold: Many
-- 4. Invoices with zero/negative totals: None
--
-- Interpretation:
-- Overall, the database is consistent. The only issue is that some tracks have never been sold, which may be due to low demand or new products.

