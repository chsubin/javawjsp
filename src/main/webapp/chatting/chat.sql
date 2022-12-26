show tables;

drop table chat;

create table chat(
	idx 	int not null auto_increment primary key,/*채팅내용 고유 번호*/
	nickName varchar(20) not null, /*별명*/
	content varchar(200) not null, /*채팅내용*/
	cDate datetime not null default now(),/*채팅올린 날짜와 시간*/
	avatar char(1) not null default '1' /*아바타*/
);

insert into chat values (default,'말숙이','안녕!!',default,default);
insert into chat values (default,'소나무','반갑다!!',default,4);

select * from  member;

select * from chat;