create table teaUser(
	userId varchar2(10) not null primary key,
	userPw varchar2(15) not null,
	userName varchar2(10) not null,
	userPhone varchar2(13) not null,
	userAddr varchar2(50) not null,
	userGrade varchar2(1) default 'c' not null,
	userState varchar2(1) default '1' not null
);
-- 등급, admin(R), vip()
--회원 등급(어드민 r)
--s vip
--a 최우수회원
--b 우수회원
--c 일반
--
--state(o, x)
--1 : 활성화
--0 : 비활성화

--------------------------------------
create table teaCommunity(
	idx number not null primary key,
	userId varchar2(10) not null,
	title varchar2(100) not null,
	content CLOB,
	regdate timestamp default systimestamp,
	count varchar(20) default 0,
	foreign key(userId) references teaUser(userId) on delete cascade
);
create sequence teaCommunitySEQ;
insert into teaCommunity(idx, userId, title, content) values(teaCommunitySEQ.nextval, 'ansalstmd0', '녹차 맛있네요.', '녹차맛있네요. 녹차맛있네요. 녹차맛있네요. 녹차맛있네요. 녹차맛있네요. 녹차맛있네요. 녹차맛있네요. 녹차맛있네요.');
select idx, userId, title, content, to_char(regdate, 'yyyy"년"mm"월"dd"일"'), count from teaCommunity;
select idx, userId, title, content, to_char(regdate, 'yyyymmdd'), count from teaCommunity;

select to_char(make_date, 'yyyy년mm월dd일'), content from a;
create table a(
	make_date timestamp default systimestamp,
	content CLOB
);

---------------------------------------
https://jmoon.co.kr/151?category=722204
create user board identified by 1234;
grant connect, resource, dba to board;

create table board(
	idx number not null primary key,
	title varchar2(200) not null,
	writer varchar2(20) not null,
	regdate varchar2(20) not null,
	count varchar(20)  not null,
	content clob  not null
);

create sequence board_seq;

--------------------------------------

idx
product name
product price
product category
product stock
product description
product saveFilename
product originalFilename

create table productCategory(
	idx number not null primary key,
	category varchar2(10) not null
);
create sequence productCategorySEQ;

insert into productCategory values(productCategorySEQ.nextval, '백차');
insert into productCategory values(productCategorySEQ.nextval, '녹차');
insert into productCategory values(productCategorySEQ.nextval, '우롱차');
insert into productCategory values(productCategorySEQ.nextval, '홍차');
insert into productCategory values(productCategorySEQ.nextval, '보이차');

select * from productCategory order by asc;

create table product(
	idx number not null primary key,
	name varchar2(200) not null,
	price number not null,
	category number not null,
	stock number not null,
	description clob,
	saveFilename varchar2(100) not null,
	originalFilename varchar2(100) not null,
	foreign key(category) references  productCategory(idx) on delete cascade
);

create sequence productSEQ;

insert into product values(productSEQ.nextval, '운남보이차', 100000, 5, 100, '중국 운남에서 수입해온 보이차', );

select * from product where name like '%홍%'
select * from product where category = 5
--------------------------------------

product idx
user userId
order

create table teaOrder(
	idx number not null,
	userId varchar2(10) not null,
	amount number not null,
	regdate timestamp default systimestamp,
	foreign key(idx) references product(idx)  on delete cascade,
	foreign key(userId) references teaUser(userId)  on delete cascade
);

insert into teaOrder(idx, userId, amount) values()

--------------------------------------

create table tableProductCategory(
	idx number not null primary key,
	category varchar2(10) not null
);

create sequence tableProductCategorySEQ;

insert into tableProductCategory values(tableProductCategorySEQ.nextval, '쿠키');
insert into tableProductCategory values(tableProductCategorySEQ.nextval, '머그');
insert into tableProductCategory values(tableProductCategorySEQ.nextval, '주전자');

select * from tableProductCategory order by idx asc;

create table tableProduct(
	idx number not null primary key,
	name varchar2(200) not null,
	price number not null,
	category number not null,
	stock number not null,
	description clob,
	saveFilename varchar2(100) not null,
	originalFilename varchar2(100) not null,
	foreign key(category) references  tableProductCategory(idx) on delete cascade
);

create sequence tableProductSEQ;

insert into product values(productSEQ.nextval, '운남보이차', 100000, 5, 100, '중국 운남에서 수입해온 보이차', );

select * from product where name like '%홍%'
select * from product where category = 5

create table tableOrder(
	idx number not null,
	userId varchar2(10) not null,
	amount number not null,
	regdate timestamp default systimestamp,
	foreign key(idx) references product(idx)  on delete cascade,
	foreign key(userId) references teaUser(userId)  on delete cascade
);

insert into tableOrder(idx, userId, amount) values()

select idx, userId, title, content, to_char(regdate, 'yyyy"년"mm"월"dd"일"'), count from teaCommunity;

select p.idx, p.name, o.userId, o.amount, to_char(regdate, 'yyyy"년"mm"월"dd"일"') as regdate, to_char(regdate + 7, 'yyyy"년"mm"월"dd"일"') as enddate from teaOrder o inner join product p on p.idx = o.idx order by regdate asc
select p.idx, p.name, o.userId, o.amount, to_char(regdate, 'yyyy"년"mm"월"dd"일"') as regdate, to_char(regdate + 7, 'yyyy"년"mm"월"dd"일"') as enddate from teaOrder o inner join product p on p.idx = o.idx where userId = 'ansalstmd0' order by regdate asc

select p.idx, p.name, o.userId, o.amount, to_char(regdate, 'yyyy"년"mm"월"dd"일"') as regdate, to_char(regdate + 7, 'yyyy"년"mm"월"dd"일"') as enddate from tableOrder o inner join tableProduct p on p.idx = o.idx order by regdate asc
select p.idx, p.name, o.userId, o.amount, to_char(regdate, 'yyyy"년"mm"월"dd"일"') as regdate, to_char(regdate + 7, 'yyyy"년"mm"월"dd"일"') as enddate from tableOrder o inner join tableProduct p on p.idx = o.idx where userId = 'ansalstmd0' order by regdate asc