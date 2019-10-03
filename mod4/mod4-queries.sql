-- select all columns, all rows
select * from customer;

-- select from columns for customers from OH
select * from customer
where state = 'OH';

-- select from columns for customers from OH, ordered by name
select * from customer
where state = 'OH'
order by name;

-- select from columns for customers from OH, ordered by name in descending name (will be on assessment)
select * from customer
where state = 'OH'
order by name desc;

select 1;

-- select name and credit limit columns, all rows with two alias ('ABC')
select name 'Name', creditLimit as 'Credit Limit'
from customer;

-- select name and credit limit columns, all rows using a table alias (where c is the alias)
select c.name 'Name', c.creditLimit as 'Credit Limit'
from customer c;

-- join view (give me all information, not very helpful)
select * 
from customer, orders;

-- join view (correct syntax with all fields, join on same variable, with Alias)
select * 
from customer c
join orders o
on c.id = o.customerID;

-- join view (correct syntax, join on same variable, with Alias)(fields of order, date, total)
select c.name 'Customer Name', o.date 'Order Date' , o.total 'Order Total'
from customer c
join orders o
on c.id = o.customerID;

-- using concat() which adds formatting and changed order of results
select c.name 'Customer Name', 
  date_format (o.date, '%M %D %Y') as 'Order Date', 
  concat( '$', o.total) as 'Order Total'
from customer c
join orders o
  on c.id = customerID
  order by c.name;
  
  -- join view - report format subselect example
select c.name 'Customer Name', 
  date_format (o.date, '%M %D %Y') as 'Order Date', 
  concat( '$', o.total) as 'Order Total'
from customer c
join orders o
  on c.id = customerID
where o.total > (
  select avg(total) from orders
)
  order by c.name;

select avg(total)
	from orders;

-- get the sum of all orders  
select sum(total)
	from orders;
 
 -- get the sum of all orders by customer
 select customerId, sum(total)
	from orders
    group by customerId;
    
-- Customer name, ID and order total
select o.customerId 'Cust. ID', c.name 'Cust. Name', sum(o.total) 'Order Total'
	from customer as c
	join orders as o
	on c.id = o.customerID
    group by customerId
    order by c.name;
    
-- Count Function
select count(*)
from orders;

-- max and min function
select max(total) from orders;
select min(total) from orders;

-- select by ID
select * from customer
where Id = 5;

-- insert a new customer
Insert into customer (name, city, state, isCorpAcct, creditLimit)
values ('Dummy', 'Dummy', 'DY', 0, 5000);

-- second way to add customer
insert into customer
values (10,'Dummy 2','Dummy', 'DY', 0, 500,1);

-- a 3rd way to insert..multiple ways
insert into customer (name, city, state, isCorpAcct, CreditLimit)
values
('Dummy 3', 'Dummy', 'DY', 0, 5555.55),
('Dummy 3', 'Dummy', 'DY', 0, 5555.55),
('Dummy 3', 'Dummy', 'DY', 0, 5555.55);

-- Update statement
update customer
	set name = 'Dummy 1'
    where id = 8;

-- delete multiple
delete from customer
where id in (11, 12, 14);

delete from customer
where id > 7;

-- sum of all orders by customer w/totals over $1,000
select customerID, sum(total) as ordertotal -- as ordertotal is the alias
from orders
group by customerID
having ordertotal > 1000;
-- having sum(total) > 1000
