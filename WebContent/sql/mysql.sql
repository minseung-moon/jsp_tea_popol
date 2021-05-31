create database tea;
use tea;

create table teaUser(
	userId varchar(10) not null primary key,
	userPw varchar(15) not null,
	userName varchar(10) not null,
	userPhone varchar(13) not null,
	userAddr varchar(50) not null,
	userGrade varchar(1) default 'c' not null,
	userState varchar(1) default '1' not null
);
insert into teaUser values('ansalstmd0', 'ansgkrthsus0', '¹®¹Î½Â', '010-9485-8055', '´ë±¸', 'r', 1);

create table teaCommunity(
	idx int not null primary key auto_increment,
	userId varchar(10) not null,
	title varchar(100) not null,
	content text,
	regdate timestamp default now(),
	count varchar(20) default 0,
	foreign key(userId) references teaUser(userId) on delete cascade
);
insert into teaCommunity(userId, title, content) values('ansalstmd0', '³ìÂ÷ ¸ÀÀÖ³×¿ä.', '³ìÂ÷¸ÀÀÖ³×¿ä. ³ìÂ÷¸ÀÀÖ³×¿ä. ³ìÂ÷¸ÀÀÖ³×¿ä. ³ìÂ÷¸ÀÀÖ³×¿ä. ³ìÂ÷¸ÀÀÖ³×¿ä. ³ìÂ÷¸ÀÀÖ³×¿ä. ³ìÂ÷¸ÀÀÖ³×¿ä. ³ìÂ÷¸ÀÀÖ³×¿ä.');
select idx, userId, title, content, date_format(regdate, '%Y³â%m¿ù%dÀÏ'), count from teaCommunity;
select idx, userId, title, content, date_format(date_add(regdate, INTERVAL 7 DAY), '%Y³â%m¿ù%dÀÏ'), count from teaCommunity;
select idx, userId, title, content,  date_format(regdate, '%Y³â%m¿ù%d') as regdate, count from teaCommunity order by idx desc;
select idx, userId, title, content, date_format(regdate, '%Y³â%m¿ù%d') as regdate, count from teaCommunity where title like '%³ì%'  order by idx desc;
insert into teaCommunity(userId, title, content) values(?, ?, ?);
select idx, userId, title, content, date_format(regdate, '%Y³â%m¿ù%d') as regdate, count from teaCommunity where idx = 1;
UPDATE teaCommunity SET count = count+1 WHERE idx = 1;
delete from teaCommunity WHERE idx = 1;
update teaCommunity set title = '³ìÂ÷ ¸ÀÀÖ³×¿ä!', content = '³ìÂ÷ ÁÁ¾Æ!' where idx = 2;

create table board(
	idx int not null primary key auto_increment,
	title varchar(200) not null,
	writer varchar(20) not null,
	regdate varchar(20) not null,
	count varchar(20)  not null,
	content text  not null
);

create table productCategory(
	idx int not null primary key auto_increment,
	category varchar(10) not null
);

insert into productCategory(category) values('³ìÂ÷');
insert into productCategory(category) values('¿ì·ÕÂ÷');
insert into productCategory(category) values('È«Â÷');
insert into productCategory(category) values('º¸ÀÌÂ÷');

select * from productCategory order by idx asc;
delete from productCategory where idx = 4;
SET foreign_key_checks = 0;
drop table productCategory;
drop table product;
SET foreign_key_checks = 1;

create table product(
	idx int not null primary key auto_increment,
	name varchar(200) not null,
	price int not null,
	category int not null,
	stock int not null,
	description text,
	saveFilename varchar(100) not null,
	originalFilename varchar(100) not null,
	foreign key(category) references  productCategory(idx) on delete cascade
);
select * from productCategory order by idx asc;
insert into product(name, price, category, stock, description, saveFilename, originalFilename) values( ?, ?, ?, ?, ?, ?, ?);
insert into product(name, price, category, stock, description, saveFilename, originalFilename) values( '¾È°èÃ¶°üÀ½', 13000, 2, 50, '¾È°èÃ¶°üÀ½', 'a', 'b');
select p.idx, p.name, p.price, c.category, p.stock, p.description, p.saveFilename, p.originalFilename from product p inner join productCategory c on p.category = c.idx order by p.idx asc;
select p.idx, p.name, p.price, c.category, p.stock, p.description, p.saveFilename, p.originalFilename from product p inner join productCategory c on p.category = c.idx where p.idx = 2 order by p.idx asc;

select p.idx, p.name, p.price, c.category, p.stock, p.description, p.saveFilename, p.originalFilename from tableProduct p inner join tableProductCategory c on p.category = c.idx order by p.idx asc;
select p.idx, p.name, p.price, c.category, p.stock, p.description, p.saveFilename, p.originalFilename from tableProduct p inner join tableProductCategory c on p.category = c.idx where p.idx = 1 order by p.idx asc;



create table teaOrder(
	idx int not null,
	userId varchar(10) not null,
	amount int not null,
	regdate timestamp default now(),
	foreign key(idx) references product(idx)  on delete cascade,
	foreign key(userId) references teaUser(userId)  on delete cascade
);
select* from teaOrder;

create table tableProductCategory(
	idx int not null primary key auto_increment,
	category varchar(10) not null
);
insert into tableProductCategory(category) values('ÄíÅ°');
insert into tableProductCategory(category) values('¸Ó±×');
insert into tableProductCategory(category) values('ÁÖÀüÀÚ');
select * from tableProductCategory order by idx asc;

create table tableProduct(
	idx int not null primary key auto_increment,
	name varchar(200) not null,
	price int not null,
	category int not null,
	stock int not null,
	description text,
	saveFilename varchar(100) not null,
	originalFilename varchar(100) not null,
	foreign key(category) references  tableProductCategory(idx) on delete cascade
);
insert into tableProduct(name, price, category, stock, description, saveFilename, originalFilename) values( ?, ?, ?, ?, ?, ?, ?);
insert into tableProduct(name, price, category, stock, description, saveFilename, originalFilename) values( 's', 10000, 3, 50, 'ss', 'ss', 'ss');
select * from product where name like '%È«%';
select * from product where category = 5;

create table tableOrder(
	idx int not null,
	userId varchar(10) not null,
	amount int not null,
	regdate timestamp default now(),
	foreign key(idx) references tableProduct(idx)  on delete cascade,
	foreign key(userId) references teaUser(userId)  on delete cascade
);
drop table tableOrder;
select * from tableOrder;
insert into tableOrder(idx, userId, amount) values(1, 1, 2);
select p.idx, p.name, o.userId, o.amount, date_format(regdate, '%Y³â%m¿ù%dÀÏ') as regdate, date_format(date_add(regdate, interval 7 day), '%Y³â%m¿ù%dÀÏ') as enddate from tableOrder o inner join tableProduct p on p.idx = o.idx order by regdate asc;