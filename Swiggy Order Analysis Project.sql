# Swiggy Order Analysis Project
# create Project.Swiggy database
Create database ProjectSwiggy;

Use ProjectSwiggy;
# Create Table Swiggy
Create Table Swiggy
(
  id int,
 cust_id Varchar(30),
 order_id int,
 partner_code int,
 outlet Varchar(20),
 bill_amount float,
 order_date date,
 Comments Varchar(40)
);

 # Insert data into Table Swiggy
 Insert into Swiggy
  (id, cust_id, order_id, partner_code, outlet, bill_amount, order_date, Comments)
  values
  (1, 'SW1005', 700, 50, 'KFC', 753, "2021-10-10", 'Door locked'),
  (2, 'SW1006', 710, 59, 'Pizza-hut', 1496, "2021-09-01",'In-time delivery'),
  (3, 'SW1005', 720, 59, 'Dominios', 990, "2021-12-10", Null),
  (4, 'SW1005', 707, 50, 'Pizza hut', 2475, "2021-12-10", Null),
  (5, 'SW1006', 770, 59, 'KFC', 1250, "2021-11-17", 'No response'),
  (6, 'SW1020', 1000, 119, 'Pizza hut', 1400, "2021-11-18", 'In-time delivery'),
  (7, 'SW2035', 1079, 135, 'Dominios', 1750, "2021-11-19", Null),
  (8, 'SW1020', 1083, 59, 'KFC', 1250, "2021-11-20", Null),
  (11, 'SW2035', 1095, 150, 'Pizza hut', 1950, "2021-12-24", 'Late delivery'),
  (9, 'SW1020', 729, 119, 'Pizza hut', 1270, "2021-11-21",'Late delivery'),
  (10, 'SW1020', 700, 135, 'KFC', 1000, "2021-09-10", 'Delivered'),
  (1, 'SW1005', 700, 50, 'KFC', 753, "2021-10-10", 'In-time delivery'),
  (2, 'SW1006', 710, 59, 'Pizza hut', 1496, "2021-09-01", Null),
  (3, 'SW1005', 720, 59, 'Dominios', 990, "2021-12-10", Null),
  (4, 'SW1005', 707, 50, 'Pizza hut', 2475, "2021-12-11", Null);
  
  
  # Find the count of duplicate rows in swiggy 
  
  Use projectswiggy;
Select id,count(*)
from Swiggy
group by 1
Having count(*)>1;

# Find the count of duplicate rows in swiggy

Select id,count(*)
from swiggy
Group by 1
Having count(*)>1;

# Remove Duplicate records from the table

# Create New table Swiggy.1 and place unique records

Create table swiggy_1
as 
with abc as
(
 select*,
 row_number() over(partition by id order by id) as Ranking
 from swiggy)
 select * from abc
 where Ranking=1;
 
 
 # Create new table swiggy_1 and print unique records from swiggy to swiggy_1
 
 Create Table swiggy_2
 as
 with abc as
 (
 select *,
 row_number() over(partition by id order by id) as Ranking
 from swiggy)
 select * from abc
 Where Ranking=1;
 
 
 
# Check swiggy 1 table
select * from swiggy_1;

# Drop the swiggy table
drop table swiggy;

# Rename swiggy_1 as swiggy table
Rename table swiggy_1 to swiggy;

Select * from swiggy;

# Print records from row number 4 to 9

Select * from swiggy
limit 3,8;

# Q4 Find the latest order placed by customers

with abc as 
(
 select cust_id,outlet,order_date,
 rank()over(partition by cust_id order by order_date desc) as ranking
 from swiggy)
 select * from abc 
 where ranking=1;

# Q5 Print order_id partner_code, order_date, comment (No issues in place of null else comment)

select order_id, partner_code, order_date,
(
 case
 when comments=""then "No issues"
 else 
 comments
 end
 ) as Comments
 from swiggy;
 
 # Q5 Print order_id partner_code, order_date, comment (No issues in place of null else comment)
  
  select order_id, partner_code, order_date,
  (
   case
   when comments=""then "No issues"
   else
   comments
   end
   ) as Comments
   from swiggy;
   
   # Q7 Print cust_id, outlet wise 'total number of orders'
   
   select cust_id,
   sum(case when Outlet ="KFC" then 1 else 0 end) as KFC,
   sum(case when Outlet ="Pizza hut" then 1 else 0 end) as Pizza_hut,
   sum(case when Outlet ="Dominios" then 1 else 0 end) as Dominios
   from swiggy
   group by 1;
   
   # Print cust_id wise, Outlet wise 'total sales' Refer to the output below
   
   select cust_id,
   sum(case when outlet = "KFC" then bill_amount else 0 end) as KFC,
   sum(case when outlet = "Pizza hut" then bill_amount else 0 end) as Pizza_hut,
   sum(case when outlet = "Dominios" then bill_amount else 0 end) as Dominios
   from swiggy
   group by 1;
   
   
   
   
   
   
   
  
  





 
 
 
 







  
  
 
 
 
 