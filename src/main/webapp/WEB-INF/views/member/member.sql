show tables;

create table member (
	idx			int not null auto_increment,			/* 회원 고유번호 */
	mid			varchar(20)	not null,					/* 회원 아이디(중복불허) */
	pwd			varchar(100)	not null,				/* 비밀번호(입력시 15자로 제한처리할것) */
	name		varchar(20)	not null,					/* 성명 */
	nickName  	varchar(20) not null,					/* 별명(중복불허) */
	gender    	varchar(10) default '남자',				/* 성별 */
	birthday	datetime	default now(),				/* 생일 */
	email		varchar(50)	not null,					/* 이메일(아이디/비밀번호 분실시 필요) */
	tel			varchar(15),							/* 연락처 */
	address		varchar(50),							/* 주소 */
	userInfo 	char(6) default '공개',					/* 회원 정보 공개여부(공개/비공개) */
	userDel		char(2) default 'NO',					/* 회원 탈퇴 신청 여부(OK:탈퇴신청한회원, NO:현재가입중인회원) */
	point     	int default 100,						/* 포인트(최초가입회원은 100, 한번 방문시마다 10 */
	level		int default 4,							/* 1:특별회원, 2:우수회원, 3:정회원, 4:준회원 0:관리자 */
	visitCnt	int default 0,							/* 방문횟수 */
	startDate 	datetime default now(),					/* 최초 가입일 */
	lastDate  	datetime default now(),					/* 마지막 접속일 */
	todayCnt 	int default 0,							/* 오늘 방문한 횟수 */
	primary key(idx, mid)								/* 키본키 : 고유번호, 아이디 */
);

--drop table member;
/* desc member; */

insert into member values (default,'admin','1234','윤은경','관리자',default,default,'vivrek@naver.com','010-4338-5064','충북 청주',
	default,default,default,0,default,default,default,default);
	
update member set pwd='qwer12345',name='김비비',nickname='비비에용용',gender='여자',tel='010-1111-2423',email='bbbb1@naver.com',userInfo='공개' where mid='bbbb1';

update member set level = 0 where mid = 'admin';
update member set pwd = '127420962', pwdKey=15, tel='010/3423/2704', address='경기도 안성시///' where mid = 'admin';
delete from member where mid='admin';

select * from member;
