create table users (
    id bigserial primary key,
    created_at timestamp default now() not null,
    updated_at timestamp default now() not null,
    name text not null
);

insert into users (name) ( select md5(random()::text) from generate_series(0, 100) );