/* guest.sql(방명록) */
create table guest (
	idx int not null auto_increment primary key,	/* 방명록 고유번호 */
	name varchar(20) not null,						/* 성명 */
	email varchar(60),								/* 이메일 */
	vDate datetime default now(),					/* 방문일자 */
	hostIp	varchar(50) not null,					/* 방문자IP */
	content text not null							/* 방명록 */
);

desc guest;
/* drop table guest; */

insert into guest (name,email,hostIp,content) values ('은경','vivrek@naver.com','1.246.157.221','안녕하세용');

select * from guest;
