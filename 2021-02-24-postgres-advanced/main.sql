create table message (
 id bigserial primary key,
 thread_id bigint not null,
 username text not null,
 message text not null
);
delete from message where 2>1;
insert into message (thread_id, username, message) values
 (1, 'yuri', 'eh pave ou pa come'),
 (1, 'erick', 'eh pacoca'),
 (1, 'erick', 'nao sei'),
 (1, 'erick', 'kkk'),
 (1, 'erick', 'kkk'),
 (1, 'lucas', 'pacome'),
 (1, 'lucas', 'q seja facil'),
 (1, 'yuri', 'economia blablabla'),
 (1, 'yuri', 'vai curintia'),
 (1, 'gabriel', 'kkk')
 ;