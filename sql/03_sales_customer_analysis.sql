-- Sales & customer analysis
-- Purpose: analyze revenue, customers, and top products

-- -- RESULTS SUMMARY
-- 1. Revenues per customer are tight. There are no big differences.
-- 2. Most revenue comes from USA, then Canada, then France
-- 3. top artists generate significant income
-- 4. Rock and Jazz are the most sold genres


USE chinook;

-- 1. Total revenue per customer

select c.FirstName, c.LastName, i.CustomerId, sum(i.Total ) as Revenue
from invoice i
left join customer c
on c.CustomerId = i.CustomerId
group by CustomerId
order by sum(i.Total) desc;

-- 2. Total revenue per country

select BillingCountry, sum(Total) as Revenue, COUNT( BillingCountry) as NumInvoices,
       COUNT(distinct CustomerId) as NumCustomers
 from invoice
 group by BillingCountry
 order by sum(Total) desc;
 
 -- 3. Top 10 artists by total sales
 
 select ar.Name, sum(i.Total) as Sales
 from invoice i
 left join invoiceline il 
  on i.InvoiceId = il.InvoiceId
 left join Track t
  on il.TrackId = t.TrackId
 left join album a
  on t.AlbumId = a.AlbumId
 left join artist ar
  on a.ArtistId = ar.ArtistId
  group by Name
  order by sum(i.Total) desc
  limit 10;
  
  -- 4. Most popular genres by quantity sold
  
  select g.GenreId, g.Name, sum(il.Quantity) as Quantity
  from genre g
  join track t
   on g.GenreId = t.GenreId
  join invoiceline il
   on il.TrackId = t.TrackId
   group by GenreId
   order by Quantity desc;

