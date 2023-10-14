-- Initial
drop table if exists items;
drop table if exists orders;

create table if not exists items (
    name VARCHAR(255) not null,
    quantity int not null default 10
);

create table if not exists orders (
    item_name VARCHAR(255) not null,
    number int not null
);

insert into items (name) values ('apple'), ('pineapple'), ('pear');