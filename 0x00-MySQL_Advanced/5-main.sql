-- show users and update
select * from users;

update users set valid_email = 1 where email = 'bob@dylan.com';
update users set email = 'sylvie+new@dylan.com' where email = 'sylvie@dylan.com';
update users set name = 'Jannis' where email = 'jeanne@dylan.com';

select "--";
select * from users;

update users set email = 'sylvie+new@dylan.com' where email = 'sylvie@dylan.com';

select "--";
select * from users;
