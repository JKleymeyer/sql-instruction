-- select all columns, all rows
select * from customer;

-- select from columns for customers from OH
select * from customer
where state = 'OH';

-- select from columns for customers from OH, ordered by name
select * from customer
where state = 'OH'
order by name;

-- select from columns for customers from OH, ordered by name in descending name
select * from customer
where state = 'OH'
order by name desc;