show tables;

/* 게시판 */
create table board (
	idx 	int not null auto_increment,		/* 고유번호 */
	category varchar(10) default '일반',			/* 카테고리 */
	mid		varchar(20) not null,				/* 아이디 */
	nickname varchar(20) not null,				/* 글쓴이 */
	title	varchar(100) not null,				/* 글제목 */
	email	varchar(50),						/* email */
	content	text not null,						/* 글내용 */
	wDate	datetime default now(),				/* 작성 날짜 */
	readNum	int default 0,						/* 조회수 */
	hostIp	varchar(50) not null,				/* 접속IP */
	primary key(idx)
);

drop table board;
desc board;
alter table board add pin int(1) not null default 0;

select count(*) from board;
select count(*) from board where nickname = '홍장군';
select * from board order by idx desc limit 1,3;
select * from board where nickname = '홍장군' order by idx desc limit 1, 2;

select * from board order by idx desc;

insert into board values (default, '공지', 'admin', '관리자', '자유게시판 서비스를 시작합니다.', 'vivrek@naver.com', '이곳은 자유게시판입니다.', default,default,'1.246.157.221');


/* 댓글 */
create table boardReply (
	idx			int not null auto_increment primary key,
	boardIdx	int not null,
	mid			varchar(20) not null,
	nickname	varchar(20) not null,
	wDate		datetime default now(),
	hostIp		varchar(50) not null,
	content		text	not null,
	level		int not null default 0,
	levelOrder	int not null default 0,
	foreign key(boardIdx) references board(idx)
	on update cascade
	on delete restrict
);

drop table boardReply;
desc boardReply;

select * from boardReply order by idx desc;