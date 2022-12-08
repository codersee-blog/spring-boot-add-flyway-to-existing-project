create schema custom_schema; 

set search_path = custom_schema; 

create type app_user_type as enum ('ADMIN', 'STANDARD');

create table app_user(
	id serial not null primary key,
	username varchar(50) not null,
	email varchar(100) not null unique,
	user_type app_user_type not null,
	created_at timestamp with time zone not null default current_timestamp 
);


create type blog_post_type as enum ('JAVA', 'KOTLIN');

create table blog_post(
	id serial not null primary key,
	title varchar(100) not null,
	category blog_post_type not null,
	content jsonb not null,
	author_id serial not null,
	created_at timestamp with time zone not null default current_timestamp,
	
	constraint fk_app_user FOREIGN KEY(author_id) REFERENCES app_user(id)
);


create table blog_post_comment(
	id serial not null primary key,
	content jsonb not null,
	author_id serial not null,
	blog_post_id serial not null,
	created_at timestamp with time zone not null default current_timestamp,
	
	constraint fk_app_user FOREIGN KEY(author_id) REFERENCES app_user(id),
	constraint fk_blog_post FOREIGN KEY(blog_post_id) REFERENCES blog_post(id)
);


insert into app_user(username, email, user_type) 
values
    ('user-1', 'email-1@codersee,com', 'ADMIN'),
    ('user-2', 'email-2@codersee,com', 'STANDARD'),
    ('user-3', 'email-3@codersee,com', 'STANDARD'),
    ('user-4', 'email-4@codersee,com', 'STANDARD'),
    ('user-5', 'email-5@codersee,com', 'STANDARD'),
    ('user-6', 'email-6@codersee,com', 'STANDARD');

insert into blog_post(title, category, content, author_id)
values
    ('Title 1', 'JAVA', '{}', 1),
    ('Title 2', 'KOTLIN', '{"field" : 1}', 1),
    ('Title 3', 'JAVA', '{ "field": "value"}', 2),
    ('Title 4', 'KOTLIN', '{}', 3),
    ('Title 6', 'JAVA', '{}', 4);

insert into blog_post_comment(content, author_id, blog_post_id)
values
    ('{ "field": "Comment 1"}', 3,1),
    ('{ "field": "Comment 2"}', 3,2),
    ('{ "field": "Comment 3"}', 1,3),
    ('{ "field": "Comment 4"}', 2,3),
    ('{ "field": "Comment 5"}', 4,3);


create view posts_with_more_than_one_comment as
    select bp.*
    from blog_post bp
    inner join blog_post_comment bpc ON bp.id = bpc.blog_post_id
    group by bp.id
    having count(bpc.id) > 1;

select * from posts_with_more_than_one_comment;

