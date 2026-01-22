-- Chinook Database Overview
-- Purpose: Understand the database structure and table relationships

USE Chinook;

-- List all tables in the database
SHOW TABLES;

-- Preview core tables
SELECT * FROM customers LIMIT 5;
SELECT * FROM invoices LIMIT 5;
SELECT * FROM invoice_items LIMIT 5;
SELECT * FROM tracks LIMIT 5;
SELECT * FROM albums LIMIT 5;
SELECT * FROM artists LIMIT 5;

-- Verify key relationships

-- Customers to Invoices
SELECT 
    c.CustomerId,
    c.FirstName,
    c.LastName,
    i.InvoiceId,
    i.Total
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
LIMIT 5;

-- Artists to Albums to Tracks
SELECT 
    ar.Name AS Artist,
    al.Title AS Album,
    t.Name AS Track
FROM artists ar
JOIN albums al ON ar.ArtistId = al.ArtistId
JOIN tracks t ON al.AlbumId = t.AlbumId
LIMIT 5;

