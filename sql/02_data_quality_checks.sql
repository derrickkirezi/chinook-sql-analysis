-- Data Quality Checks
-- Purpose: Identify missing, inconsistent, or orphaned records
-- in the Chinook database

USE Chinook;

-- 1. Check for customers with no invoices
-- These customers exist but have never made a purchase
SELECT 
    c.CustomerId,
    c.FirstName,
    c.LastName
FROM customers c
LEFT JOIN invoices i 
    ON c.CustomerId = i.CustomerId
WHERE i.InvoiceId IS NULL;

-- 2. Check for invoices with no invoice items
-- Every invoice should have at least one item
SELECT 
    i.InvoiceId,
    i.InvoiceDate,
    i.Total
FROM invoices i
LEFT JOIN invoice_items ii 
    ON i.InvoiceId = ii.InvoiceId
WHERE ii.InvoiceId IS NULL;

-- 3. Check for tracks that were never sold
-- Identifies products with zero sales
SELECT 
    t.TrackId,
    t.Name
FROM tracks t
LEFT JOIN invoice_items ii 
    ON t.TrackId = ii.TrackId
WHERE ii.TrackId IS NULL;

-- 4. Check for negative or zero invoice totals
-- Invoice totals should always be positive
SELECT 
    InvoiceId,
    Total
FROM invoices
WHERE Total <= 0;
