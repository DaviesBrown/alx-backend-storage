-- initial
drop table if exists corrections;
drop table if exists users;
drop table if exists projects;

create table if not exists users (
    id int not null AUTO_INCREMENT,
    name VARCHAR(255) not null,
    average_score float default 0,
    PRIMARY KEY (id)
);
create table if not exists projects (
    id int not null AUTO_INCREMENT,
    name VARCHAR(255) not null,
    PRIMARY KEY (id)
);
create table if not exists corrections (
    user_id int not null,
    project_id int not null,
    score int default 0,
    KEY `user_id` (`user_id`),
    KEY `project_id` (`project_id`),
    constraint fk_user_id foreign key (`user_id`) references `users` (`id`) on delete cascade,
    constraint fk_project_id foreign key (`project_id`) references `projects` (`id`) on delete cascade
);
insert into users (name) values ("Bob");
set @user_bob = LAST_INSERT_ID();

insert into users (name) values ("Jeanne");
set @user_jeanne = LAST_INSERT_ID();

insert into projects (name) values ("C is fun");
set @project_c = LAST_INSERT_ID();

insert into projects (name) values ("Python is cool");
set @project_py = LAST_INSERT_ID();

insert into corrections (user_id, project_id, score) values (@user_bob, @project_c, 80);
insert into corrections (user_id, project_id, score) values (@user_bob, @project_py, 96);
insert into corrections (user_id, project_id, score) values (@user_jeanne, @project_c, 91);
insert into corrections (user_id, project_id, score) values (@user_jeanne, @project_py, 73);