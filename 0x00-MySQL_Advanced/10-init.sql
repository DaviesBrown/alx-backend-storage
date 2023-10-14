drop table if exists numbers;
create table if not exists numbers (
    a int default 0,
    b int default 0
);

insert into numbers (a, b) values (10, 2);
insert into numbers (a, b) values (4, 5);
insert into numbers (a, b) values (2, 3);
insert into numbers (a, b) values (6, 3);
insert into numbers (a, b) values (7, 0);
insert into numbers (a, b) values (6, 8);