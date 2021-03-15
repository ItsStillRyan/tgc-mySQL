-- CRUD
--create
insert into Parents (sur_name, given_name, email)
    values('Tan','Ryan','itsnayr.t@gmail.com'),
          ('','','');
--delete
delete from Parents where parents_id = 3;
drop table -tablename-
-- modify row (update)
-- where i want to update -- set what i want to change -- define which content to change
update Students set first_name = "Susan" where student_id = 2

-- create table
create table Parents (
    --unsigned = no negative numbers
    parent_id int unsigned auto_increment primary key,
    -- null = cannot be null/ empty
    sur_name varchar(50) not null,
    given_name varchar(50) not null,
    email varchar(250) not null

) engine=innodb; -- reinforce forign keys

create table Students (
    student_id int unsigned auto_increment primary key,
    surname varchar(100) not null,
    given_name varchar(100) not null,
    date_of_birth date not null,
    parent_id int unsigned not null,
    foreign key(parent_id) references Parents(parent_id)
) engine=innodb;

insert into Students (surname, given_name, date_of_birth, parent_id)
   values ('Phua', 'Anthony', '1990-06-21', 1);
_______________________--
create table Department (
    department_id int unsigned auto_increment primary key,
    `name` varchar(100) not null
)engine=innodb;

create table Taskforces (
    taskforce_id int unsigned auto_increment primary key,
    `name` varchar(100) not null
)engine=innodb;

create table Employees (
    employee_id int unsigned auto_increment primary key,
    surname varchar(100) not null,
    given_name varchar(100) not null,
    date_of_employ date not null,
    department_id int unsigned,
    foreign key(department_id) references Department(department_id)
) engine=innodb;

create table Addresses (
    address_id int unsigned auto_increment primary key,
    blk_number varchar(100) not null,
    street varchar(200) not null,
    unit_code varchar(50) not null,
    postal_code varchar(20) not null,
    employee_id int unsigned,
    foreign key(employee_id) references Employees(employee_id)
)engine=innodb;

create table EmployeeTaskforce (
    employee_id int unsigned,
    taskforce_id int unsigned,
    foreign key(employee_id) references Employees(employee_id),
    foreign key(taskforce_id) references Taskforces(taskforce_id),
    role varchar(100) not null
)engine=innodb;

create table Supervisor (
    supervisor_id int unsigned auto_increment primary key,
    employee_id int unsigned,
    foreign key(employee_id) references Employees(employee_id)
)engine=innodb;

insert into Department(`name`)
    values('HR'),
        ('IT'),
        ('Finance'),
        ('Marketing')

insert into Employees(surname,given_name,date_of_employ,department_id)
values('Tan','Ryan','2020-03-15',2)

insert into Addresses(blk_number,street,unit_code,postal_code,employee_id)
values('611','Woodlands Ring Road','07-201','Singapore 730611',1)

insert into Taskforces(`name`)
value('Project')

insert EmployeeTaskforce(employee_id,taskforce_id,role)
value(1,1,'Lead');

insert Supervisor(employee_id)
value(1)