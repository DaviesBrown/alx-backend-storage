-- show and order
select * from items;
select * from orders;

insert into orders (item_name, number) values ('apple', 1);
insert into orders (item_name, number) values ('apple', 3);
insert into orders (item_name, number) values ('pear', 2);

select '--';

select * from items;
select * from orders;