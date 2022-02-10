create table qna (
	idx 	int not null auto_increment,		/* 고유번호 */
	mid		varchar(20) not null,				/* 아이디 */
	nickname varchar(20) not null,				/* 글쓴이 */
	title	varchar(100) not null,				/* 문의제목 */
	content	text not null,						/* 문의내용 */
	wDate	datetime default now(),				/* 작성 날짜 */
	primary key(idx)
);

select * from qna order by idx desc;