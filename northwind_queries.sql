-- Retrieve all products from the "Products" table.

select * from products;

-- Retrieve the names and prices of products from the "Products" table in descending order of price.

select productname , price from products 
order by price desc;

-- Retrieve the names and addresses of customers from the "Customers" table located in the USA.
select customername , address from customers
where country = "USA";

-- Retrieve the categories with more than 10 products from the "Categories" table.

select categoryname ,count(productID) as num_products from categories
join products on categories.CategoryID = products.CategoryID
group by categoryname
having num_products > 10 ;

-- Retrieve the names and quantities of products from the "OrderDetails" table where the quantity is greater than 50.

select productname , quantity from orderdetails
join products on orderdetails.ProductID = products.ProductID
where quantity > 50;

-- How many customers are there in the database?

select count(distinct customerID) as num_customers from customers;

-- What are the different categories of products available?

select distinct c.categoryid , distinct c.categoryname  from products p
join categories c on p.CategoryID = c.CategoryID;

-- How many orders have been placed by each customer?
 
 select CustomerName  , count(orderid) from orders o
 join customers c on o.customerid = c.customerid
 group by CustomerName;

-- What is the total revenue generated from all orders?

select sum(p.price * od.quantity) as total_revenue
from products p
join orderdetails od
on p.ProductID = od.ProductID;

-- Which employee has the highest number of orders?

select concat(firstname ," ", lastname) as emp_name , count(orderid) as num_orders
from employees e join orders o on e.EmployeeID = o.EmployeeID
group by concat(firstname ," ", lastname)
order by num_orders desc
limit 1;

-- What are the top 5 best-selling products?

select productname , SUM(od.Quantity) AS TotalQuantitySold from products p
join orderdetails od on p.ProductID = od.ProductID
group by productname
order by Totalquantitysold desc
limit 5;

-- Which customer has placed the most expensive order?

select c.customerid, customername , max(p.price * od.quantity) as order_amnt
from customers c
join orders o on c.CustomerID = o.CustomerID
join orderdetails od on o.Orderid = od.OrderID
join  products p on od.ProductID = p.ProductID
group by customerid ,customername
order by order_amnt desc
limit 1;

-- What is the average unit price of all products?

SELECT AVG(Price) AS AverageUnitPrice
FROM Products;

-- How many distinct countries are represented in the "Customers" table?

select count(distinct country ) as distinct_countries from customers;

-- Which category has the highest average unit price among its products?

select categoryname , avg(price) as avg_price
from products p
join categories c on p.categoryid = c.CategoryID
group by categoryname 
order by avg_price desc
limit 1;

-- What is the average quantity of products sold per order?

select od.orderid , avg(quantity) as avg_quantity
from orderdetails od
group by od.orderid;

-- Which supplier has the highest number of products?

select s.supplierid , s.suppliername , count(productid)  as num_products
from products p join suppliers s on p.SupplierID = s.SupplierID
group by s.supplierid , s.suppliername
order by num_products desc
limit 1;

-- What is the total revenue generated by each category?

select c.categoryid , c.categoryname , sum(p.price * od.quantity) as total_revenue
from categories c join products p on c.CategoryID = p.CategoryID
join orderdetails od on p.ProductID = od.ProductID 
group by c.CategoryID , c.CategoryName;

-- Which customer has the highest total spending on orders?

select c.customerid, customername , sum(p.price * od.quantity) as total_amnt_spent
from customers c 
join orders o on c.CustomerID = o.CustomerID
join orderdetails od on o.Orderid = od.OrderID
join  products p on od.ProductID = p.ProductID
group by c.customerid ,customername
order by total_amnt_spent desc
limit 1;

-- How many orders have been placed in each year?

select count(orderid) as num_orders , year(OrderDate) as year from orders
group by year(OrderDate);
