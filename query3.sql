#Find the average price of the payment receipts:

select avg(invoice.TotalCost) as avgCost
from invoice