drop database if exists bmdb;
create database bmdb;
use bmdb;

create table Movie (

	id 				int 			not null primary key auto_increment,
	title 			varchar(100) 	not null unique,
	rating 			varchar(5) 		not null,
	year 			int 			not null,
	director 		varchar(50)		not null
    
);

Insert into movie (title, rating, year, director)
values ('Halloween', 'R', 1978, 'John Carpenter'),
('Hocus Pocus', 'PG', 1993, 'Kenny Ortega'),
('The Nightmare Before Christmas', 'PG', 1993, 'Henry Selick'),
('Ghostbuster', 'PG', '1984', 'Ivan Reitman'),
('Friday the 13th', 'R', 1980, 'Sean S. Cunningham'),
('Its the Great Pumpkin Charlie Brown', 'NR', '1966', 'Bill Melendez'),
('Scream', 'R', '1996', 'Wes Craven'),
('A Nightmare on Elm Street', 'R', '1984', 'Wes Craven'),
('The Monster Squad', 'PG-13', '1987', 'Fred Dekker'),
('The Rocky Horror Picture Show', 'R', '1975', 'Jim Sharman');


create table Actor (

	id 				int 			not null primary key auto_increment,
	firstName 		varchar(25) 	not null,
	lastName		varchar(25) 	not null,
	gender 			varchar(6) 		not null,
    birthDate		date			not null,
    constraint unq_actor unique (firstName, lastName, birthDate)
);

Insert into Actor (firstName, lastName, gender, birthDate) values 
('Jamie Lee', 'Curtis', 'Female', '1958-11-22'),
('Donald', 'Pleasence', 'Male',  '1919-10-05'),
('P.J', 'Soles', 'Female', '1950-07-17'),
('Bette', 'Midler', 'Female', '1945-12-01'),
('Sarah Jessica', 'Parker', 'Female', '1965-03-25'),
('Kathy', 'Najimy', 'Female', '1957-02-06'),
('Danny', 'Elfman', 'Male', '1953-05-29'),
('Chris', 'Sarandon', 'Male', '1942-07-24'),
('Catherine', 'O Hara', 'Female', '1954-03-04'),
('Bill', 'Murray', 'Male', '1950-09-21'),
('Dan', 'Aykroyd', 'Male', '1952-7-1'),
('Sigourney', 'Weaver', 'Female', '1949-10-08'),
('Betsy', 'Palmer', 'Female', '1926-11-01'),
('Adrienne', 'King', 'Female', '1955-07-21'),
('Jeannine', 'Taylor', 'Female', '1954-06-02'),
('Peter', 'Robbins', 'Male', '1956-08-10'),
('Christopher', 'Shea', 'Male', '1958-02-05'),
('Sally', 'Dryer', 'Female', '1957-02-10'),
('Drew', 'Barrymore', 'Female', '1975-02-22'),
('Roger', 'Jackson', 'Male', '1958-07-13'),
('Neve', 'Campbell', 'Female', '1973-10-03'),
('Robert', 'Englund', 'Male', '1947-06-06'),
('John', 'Saxon', 'Male', '1935-08-05'),
('Ronee', 'Blakley', 'Female', '1945-08-24'),
('Duncan', 'Regehr', 'Male', '1952-10-05'),
('Tom', 'Noonan', 'Male', '1951-04-12'),
('Ryan', 'Lambert', 'Male', '1971-03-29'),
('Tim', 'Curry', 'Male', '1946-04-19'),
('Susan', 'Sarandon', 'Female', '1946-10-04'),
('Barry', 'Bostwick', 'Male', '1945-02-24');


create table Credit (

	id			int				not null primary key auto_increment,
    movieID		int				not null,
    actorID		int				not null,
    role		varchar(255)	not null,
	FOREIGN KEY (movieID) REFERENCES movie(id),
	FOREIGN KEY (actorID) REFERENCES actor(id)
    
);


Insert into Credit (movieID, actorID, role) values 
(1, 1, 'Laurie'),
(1, 2, 'Loomis'),
(1, 3, 'Lynda'),
(2, 4, 'Winifred'),
(2, 5, 'Sarah'),
(2, 6, 'Mary'),
(3, 7, 'Jack Skellington Singing Voice'),
(3, 8, 'Jack Skellington'),
(3, 9, 'Sally/Shock'),
(4, 10, 'Dr. Peter Venkman'),
(4, 11, 'Dr. Raymond Stantz'),
(4, 12, 'Dana Barrett'),
(5, 13, 'Mrs. Voorhees'),
(5, 14, 'Alice'),
(5, 15, 'Marcie'),
(6, 16, 'Charlie Brown'),
(6, 17, 'Linus Van Pelt'),
(6, 18, 'Lucy Van Pelt'),
(7, 19, 'Casey Becker'),
(7, 20, 'Phone Voice'),
(7, 21, 'Sidney Prescott'),
(8, 22, 'Fred Krueger'),
(8, 23, 'Lt. Thompson'),
(8, 24, 'Marge Thompson'),
(9, 25, 'Count Dracula'),
(9, 26, 'Frankensteins Monster'),
(9, 27, 'Rudy'),
(10, 28, 'Dr. Frank-N-Furter - A Scientist'),
(10, 29, 'Janet Weiss - A Heroine'),
(10, 30, 'Brad Majors - A Hero');

-- create a user and grant privileges to that user
DROP USER IF EXISTS bmdb_user@localhost;
CREATE USER bmdb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON bmdb.* TO bmdb_user@localhost;