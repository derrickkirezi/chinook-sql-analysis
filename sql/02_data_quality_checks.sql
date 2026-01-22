-- Data quality check
-- Purpose: identify missing and inconsistent records
-- in the Chinook database

-- SUMMARY RESULTS
  -- 1. Customers with no invoices: None
  -- 2. Invoices with no items: None
  -- 3. Tracks never sold: Many
  -- 4. Invoices with zero/negative totals: None
  --
 -- INTERPRETATION:
  -- Overall, the database is consistent. The only issue is that some tracks have never been sold, which may be due to low demand or newly introduced products.


USE chinook;

--1. Check for customers with no invoices

select c.FirstName, c.LastName, i.InvoiceId
from customer c
left join invoice i on c.CustomerId = i.CustomerId
where InvoiceId is null;

--2. Check for invoices with no invoice items

select i.InvoiceId, il.InvoiceLineId
from invoice i
left join invoiceline il 
on i.InvoiceId = il.InvoiceId
where InvoiceLineId is null;

--3. Tracks that were never sold

select t.TrackId, t.Name, il.InvoiceId
from track t
left join invoiceline il
on t.TrackId = il.TrackId
where InvoiceId is null;

--4. Invoices with zero or negative totals

select InvoiceId, Total
from invoice
where Total <= 0;
