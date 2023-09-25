-- Retrieve all the data from the 'Customers' table?
select * from dbo.agriculture_dataset;

-- Find the total number of orders in the 'Orders' table?
select count(*) as "Total Orders" from dbo.agriculture_dataset;

-- What is the maximum modal price for each commodity and variety?
select commodity, variety, max("Modal Price") as "Max Modal Price"
from dbo.agriculture_dataset
group by commodity, variety;

-- What is the minimum modal price for each commodity and variety?
select commodity, variety, min("Modal Price") as "Min Modal Price"
from dbo.agriculture_dataset
group by commodity, variety;

-- What is the average modal price for each commodity and variety in Andhra Pradesh?
select commodity, variety, avg("Modal Price") as "Avg Modal Price"
from dbo.agriculture_dataset
where state = 'Andhra Pradesh'
group by commodity, variety;

-- What is the maximum and minimum modal price for each commodity in Andhra Pradesh?
select commodity, max("Modal Price") as "Max Modal Price", min("Modal Price") as "Min Modal Price"
from dbo.agriculture_dataset
where state = 'Andhra Pradesh'
group by commodity;

-- What are the unique districts in the dataset?
select distinct district from dbo.agriculture_dataset;

-- What is the total modal price for each commodity in each state?
select state, commodity, sum("Modal Price") as "Total Modal Price"
from dbo.agriculture_dataset	
group by state, commodity;

-- What is the average modal price for each commodity in each district?
select district, commodity, avg("Modal Price") as "Avg Modal Price"
from dbo.agriculture_dataset
group by district, commodity;

-- Which district has the highest average modal price for each commodity?
select commodity, district, avg("Modal Price") as "Avg Modal Price"
from dbo.agriculture_dataset
group by Commodity, District
having avg("Modal Price") = (select max("Avg Modal Price") from (select commodity, avg("Modal Price") as "Avg Modal Price"
from dbo.agriculture_dataset group by commodity, district) as "Max Avg Price Per Commodity");

-- Which variety of each commodity has the highest modal price?
select commodity, variety, max("Modal Price") as "Max Modal Price"
FROM dbo.agriculture_dataset
group by commodity, variety;

-- What is the overall average modal price across all commodities and varieties?
select avg("Modal Price") as "Overall Avg Modal Price" from dbo.agriculture_dataset;

-- What are the top 5 commodities with the highest total modal price across all districts?
select top 5 commodity, sum("Modal Price") as "Total Modal Price"
from dbo.agriculture_dataset
group by commodity
order by "Total Modal Price" desc;

-- Which state has the highest average modal price?
select top 1 state, avg("Modal Price") as "Avg Modal Price"
from dbo.agriculture_dataset
group by state
order by "Avg Modal Price" desc;

-- Which commodity has the maximum and minimum modal price?
select commodity, max("Modal Price") as "Max Modal Price", min("Modal Price") as "Min Modal Price"
from dbo.agriculture_dataset
group by commodity;

-- What is the percentage of the total modal price contributed by each commodity?
select commodity, sum("Modal Price") as "Total Modal Price", 
(sum("Modal Price") / (select sum("Modal Price") from dbo.agriculture_dataset)) * 100 as "Percentage Contribution"
from dbo.agriculture_dataset
group by Commodity order by "Percentage Contribution" desc;




















