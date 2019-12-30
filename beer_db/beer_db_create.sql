drop database if exists beer;
create database beer;
use beer;

create table Brewery (

	id 				int 			not null primary key auto_increment,
	name 			varchar(255)	not null,
	city 			varchar(255)	not null,
	state	 		varchar(2)		not null,
    rating	 		varchar(50)		not null
);

insert into brewery(name, city, state, rating) values
('Avery Brewing Company', 'Boulder', 'CO', 5),
('Madtree Brewing Company', 'Cincinnati', 'OH', 5),
('March First Brewing Company', 'Cincinnati', 'OH', 3),
('New Belgium Brewing Company', 'Fort Collins', 'CO', 5),
('Stone Brewing Company', 'Escondido', 'CA', 5);
 

create table Beer (

	id 				int 			not null primary key auto_increment,
	breweryId 		int			 	not null,
	name 			varchar(255) 	not null,
	style 			varchar(255)	not null,
	abv		 		varchar(5)		not null,
    ibu		 		varchar(3)		not null,
    rating	 		varchar(5)		not null,
	FOREIGN KEY (breweryID) REFERENCES brewery(id)
);

insert into beer (breweryID, name, style, abv, ibu, rating) values
(1, 'White Rascal', 'Witbier', '5.6', '22', '3.25'),
(1, 'Sweater Party', 'Strong Ale', '8.3', '25', '3.75'),
(2, 'Luna Lux', 'IPA - White', '6', '39', '3.5'),
(2, 'PsycHOPathy', 'IPA - American', '6.9', '60', '3.75'),
(3, 'Irish Red', 'Red Ale - Irish', '5.2', '18', '3.5'),
(3, 'Swiss Chocolate Stout', 'Stout - Milk/Sweet', '7.5', '34', '4.00'),
(4, 'Sour Saison', 'Sour', '7', '18', '4.5'),
(4, 'The Hemperor HPA', 'IPA - American', '7', '55', '4'),
(5, 'Mint Coffee Milk Stout', 'Stout - Milk/Sweet', '5', '40', '4.25'),
(5, 'Stone Ripper', 'Pale Ale - American', '5.7', '40', '4');

create table Venue (

	id 				int 			not null primary key auto_increment,
	name 			varchar(255) 		not null,
	address			varchar(255) 	not null,
    city	 		varchar(50)		not null,
    state	 		varchar(2)		not null
);

insert into venue (name, address, city, state) values
('The Growler House', '1526 Madison Rd', 'Cincinnati', 'OH'),
('Oakley Pub and Grill', '3924 Isabella Ave', 'Cincinnati', 'OH'),
('Flipdaddys Burgers and Beers', '7453 Wooster Pike', 'Cincinnati', 'OH'); 

create table onTap (

	id 				int 			not null primary key auto_increment,
	venueID 		int 			not null,
	beerID 			int 			not null,
	FOREIGN KEY (venueID) REFERENCES venue(id),
	FOREIGN KEY (beerID) REFERENCES beer(id)
);

insert into onTap (venueID, beerID) values
(1,3),
(1,2),
(2,2),
(2,9),
(3,5),
(3,6),
(3,7);

-- create a user and grant privileges to that user
DROP USER IF EXISTS beer_user@localhost;
CREATE USER beer_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON beer.* TO beer_user@localhost;