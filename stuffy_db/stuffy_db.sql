drop database if exists stuffy_db;
create database stuffy_db;
use stuffy_db;

create table stuffy (
	id 				int 			primary key auto_increment,
	type			varchar(255)	not null,
    color			varchar(20)		not null,
    size			varchar(2)		not null,
    limbs			int				not null
    
	);

insert into stuffy (id, type, color, size, limbs) 
	values 
    (1, 'Spider', 'Blue', 'L', 8),
    (2, 'Frog', 'Green', 'S', 4),
    (3, 'Dog', 'White', 'M', 4),
    (4, 'Snake', 'Green', 'L', 0),
    (5, 'Snail', 'Brown', 'S', 0),
    (6, 'Whale', 'Black', 'XL', 0),
    (7, 'Eagle', 'Brown', 'L', 2),
    (8, 'Cat', 'Black', 'M', 3),
    (9, 'Aligator', 'Green', 'L', 4),
    (10, 'Kraken', 'Orange', 'XL', 10);
    
CREATE USER stuffy_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON stuffy.* TO stuffy_user@localhost;
    

