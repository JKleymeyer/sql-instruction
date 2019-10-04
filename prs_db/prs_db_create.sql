drop database if exists prs;
create database prs;
use prs;

Create table user (

	id 				int 			not null primary key auto_increment,
	username		varchar(20) 	not null unique,
	password		varchar(10) 	not null,
	FirstName 		varchar(20)		not null,
	LastName 		varchar(20)		not null,
    PhoneNumber		varchar(12)		not null,
    Email			varchar(75)		not null,
    IsReviewer		TinyInt(1)		not null,
    IsAdmin			TinyInt(1)		not null

);

Create table vendor (

	id 				int 			not null primary key auto_increment,
	code			varchar(10) 	not null unique,
	Name			varchar(255) 	not null,
	Address 		varchar(255)	not null,
    City			varchar(255)	not null,
    state			varchar(2)		not null,
    Zip				Varchar(5)		not null,
    PhoneNumber		varchar(12)		not null,
    Email			varchar(100)	not null

);

Create table request (

	id 						int 			not null primary key auto_increment,
	UserID					int			 	not null,
	Description				varchar(100) 	not null,
	Justification 			varchar(255)	not null,
    DateNeeded				date			not null,
    DeliveryMode			varchar(25)		not null,
    Status					varchar(20)		not null,
    Total					decimal(10,2)	not null,
    SubmittedDate			datetime		not null,
    ReasonForRejection		varchar(100),
    
	FOREIGN KEY (userID) REFERENCES user(id)

);

Create table product (

	id 						int 			not null primary key auto_increment,
	VendorID				int			 	not null,
	PartNumber				varchar(50) 	not null,
	Name		 			varchar(150)	not null,
    Price					decimal(10,2)	not null,
    Unit					varchar(255),
    PhotoPath				varchar(255),
    
	FOREIGN KEY (VendorID) REFERENCES vendor(id),
    CONSTRAINT vendor_part UNIQUE (VendorID, PartNumber)
    
);

Create table LineItem (

	id 						int 			not null primary key auto_increment,
	requestID				int			 	not null,
	productID				int			 	not null,
	quantitiy		 		int				not null,
    
	FOREIGN KEY (ProductID) REFERENCES product(id),
	FOREIGN KEY (requestID) REFERENCES request(id),
    CONSTRAINT req_pdt UNIQUE (RequestID, ProductID)
    
);

insert into user (username, password, firstname, lastname, phonenumber, email, isreviewer, isadmin)
values ('JKleymeyer', 'password', 'Josh', 'Kleymeyer', '859-123-1234', 'fake@gmail.com', 0, 0),
('SKleymeyer', 'password!', 'Sarah', 'Kleymeyer', '513-123-1234', 'faker@gmail.com', 1, 0),
('TKleymeyer', 'password!!', 'Ted', 'Kleymeyer', '859-112-1234', 'fakest@gmail.com', 1, 1);

insert into vendor (code, name, address, city, state, zip, phonenumber, email)
values ('Stp', 'Staples', '2310 Buttermilk Crossing', 'Crescent Springs', 'KY', '41017', '859-098-0987', 'staples@staples.com');

insert into product (vendorId, Partnumber, name, price, unit, photopath)
values (1, '24393909', 'HP 17-by1062st', 429.99, null, null),
(1, '136815', 'Staples Mesh Back Computer and Desk Chair', 119.99, null, null);



DROP USER IF EXISTS prs_user@localhost;
CREATE USER prs_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON prs.* TO prs_user@localhost;