--join & foreign key 복습

--시퀀스
create SEQUENCE seq_board;

drop sequence seq_board;
--부모테이블
create table board (bno number(3)constraint board_pk_bno primary key,
writer varchar2(30), subject varchar(50),writerday date);

drop table board;
--게시글 board에 5개의 데이터 insert
insert into board values(seq_board.nextval,'오늘도 열심히','안녕하세요 오늘가입했어요',sysdate);
insert into board values(seq_board.nextval,'내일도 열심히','감사해요',sysdate);
insert into board values(seq_board.nextval,'모레도 열심히','화이팅',sysdate);
insert into board values(seq_board.nextval,'글피도 열심히','안녕하세요 오늘가입했어요',sysdate);
insert into board values(seq_board.nextval,'어제도 열심히 했지','다시 만나요',sysdate);
insert into board values(seq_board.nextval,'투모로우','살아서 만나요',sysdate);
commit;
select * from board;
--자식테이블
--부모글 지우면 그 글에 달린 댓글은 자동으로 삭제되도록 설정
create table answer(num number(5) CONSTRAINT answer_pk_num primary key,
bno number(3) CONSTRAINT answer_fk_bno references board(bno) on DELETE CASCADE,
nickname varchar2(30), content varchar2(100));

insert into answer values(seq_board.nextval,4, '먹방찍자', '오늘은 초밥먹는날');
insert into answer values(seq_board.nextval,1, '열심맨', '반가워요');
insert into answer values(seq_board.nextval,3, '반말가이', '그래');
insert into answer values(seq_board.nextval,5, '슬픈사람', '다음에 봐요');
insert into answer values(seq_board.nextval,1, '화이팅', '어서오세요');
commit;
rollback;
select * from answer;
--JOIN으로 출력
--bno(글번호) writer(작성자) subject(제목) nickname(댓글단사람) content(댓글 내용) writerday(원글 올린 날짜)
select b.bno 글번호,writer 작성자,subject 제목, nickname 댓글단사람, content 댓글내용,writerday 원글올린날짜
from board b,answer a where b.bno=a.bno;

select buseo, to_char(avg(pay),'L999,999,999') avgpay, to_char(max(pay),'l999,999,999'),to_char(min(pay),'l999,999,999')
						from sawon group by buseo;
                        
select c.idx idx,s.sangpum sangpum,s.color color,c.cnt,c.guipday from shop s,cart1 c where s.num=c.num;