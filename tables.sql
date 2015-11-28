create table Products(

product_id int not null auto_increment,
vendor varchar(60) not null,
product varchar(60),
version varchar(30),
linux_command varchar(30),
window_command varchar(30),
primary key (product_id)

);


create table Patches(

patch_id varchar(60) not null,
description varchar(1000),
url varchar(60),
pub_date date,
up_date date,
primary key (patch_id)

);

create table Patch_cve(

patch_id varchar(60),
cve varchar(14),
foreign key (patch_id) references Patches(patch_id),
foreign key (cve) references VulnerabilitiesCVE(cve)
);

create table VulnerabilitiesCVE
    (
    cve varchar(14) not null,
    description varchar(2000),
    pub_date date,
    up_date date,
    score decimal(3,1),
    type varchar(100),
    url varchar(65),
    primary key (cve)
    );




create table Product_cve(

product_id int,
cve varchar(14),
foreign key (product_id) references Products(product_id),
foreign key (cve) references VulnerabilitiesCVE(cve)
);


create table Exploits (
    exploit_id varchar(9) not null,
    cve varchar(30) not null,
    date date,
    exploit varchar (10000) not null,
    primary key (exploit_id),
    foreign key (cve) references VulnerabilitiesCVE(cve)
    
    );



create table Nodes (

mac varchar(20) not null,
cores int,
ram int,
primary key (mac)

);

create table OS (

os_id int not null auto_increment,
name varchar(30),
version varchar(30),
primary key (os_id)

);

create table Nodes_OS_Product (

mac varchar(20) not null,
product_id int,
os_id int,
ip varchar (15),
foreign key (mac) references Nodes(mac),
foreign key (product_id) references Products(product_id),
foreign key (os_id) references OS(os_id)

);



