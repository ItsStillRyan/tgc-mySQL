-- loggin in
-- sql user username (root create by default)
mysql -u root

-- see all databases
show databases;

-- create database
create database swimming;

-- switch database
use swimming;

-- show tables
show tables;

-- create table
create table Parents (
    --unsigned = no negative numbers
    parent_id int unsigned auto_increment primary key,
    -- null = cannot be null/ empty
    sur_name varchar(50) not null,
    given_name varchar(50) not null,
    email varchar(250) not null

) engine=innodb; -- reinforce forign keys

-- adding many rows 
insert into Parents (sur_name, given_name, email)
    values('Tan','Ryan','itsnayr.t@gmail.com'),
          ('','','');

-- see all rows in table
select * from Parents

-- show all details about each rows
describe venues;
-------------------------------------------
create table Venues (
    venue_id int unsigned auto_increment primary key,
    address varchar(500) not null,
) engine=innodb;

insert into Certificates (title)
    values('Intermediate'),
        ('Advance'),
        ('Lifesaving')

insert into Venues(address)
    values('Yishun Ave 4'),
        ('Ang Mo Kio Ave 1')