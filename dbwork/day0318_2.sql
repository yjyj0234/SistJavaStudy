--시퀀스 생성
create sequence seq_shop;
--shop 테이블(부모)
create table shop(num number(5)primary key,
sangpum varchar2(30), color varchar2(20));

--shop에 5개이상 상품 추가
insert into shop values(seq_shop.nextval, '블루베리','블루');
insert into shop values(seq_shop.nextval, '딸기','레드');
insert into shop values(seq_shop.nextval, '블랙베리','블랙');
insert into shop values(seq_shop.nextval, '오렌지','오렌지색');
insert into shop values(seq_shop.nextval, '라즈베리','레드');

commit;
select * from shop;

--cart1:자식테이블  shop테이블의 num값을 외부키로 지정한다
create table cart1(idx number(5)primary KEY,
num number(5) CONSTRAINT cart_fk_num references shop(num),
cnt number(5),guipday date);

--create table cart1(idx number(5)primary KEY,
--num number(5),
--cnt number(5),guipday date,
--CONSTRAINT cart_fk_num foreign key(num) references shop(num)); 이렇게 따로 주는 것도 가능



--cart2:부모테이블의 상품을 지우면 그상품과 연결된 카트를 자동으로 지워준다
create table cart2(idx number(5)primary KEY,
num number(5) CONSTRAINT cart2_fk_num references shop(num) on delete cascade,
cnt number(5),guipday date);

--cart1에 상품추가
insert into cart1 values(seq_shop.nextval, 1,2,sysdate);--1번 블루베리 2개
insert into cart1 values(seq_shop.nextval, 5,1,sysdate);--5번 라즈베리 1개
insert into cart1 values(seq_shop.nextval, 6,1,sysdate);--shop에 없는상품 : 무결성 제약조건에 위배 부모키 x

--cart2에 상품추가
insert into cart2 values(seq_shop.nextval, 3,4,sysdate);--3번 블랙베리 4개
insert into cart2 values(seq_shop.nextval, 2,4,sysdate);--2번 블랙베리 4개

--cart1 에는 1번 5번이 추가되었다 이때 shop의 1번상품을 삭제해보자
delete from shop where num=1; --무결성 제약조건(YJYJ0234.CART_FK_NUM)이 위배되었습니다- 자식 레코드가 발견되었습니다
--4번 삭제
delete from shop where num=4; --어디에도 안담겨 있어서 삭제됨

rollback;--아까우니 살림

--shop의 3번 삭제(cart2에 담겨있음)
delete from shop where num=3;

insert into cart1 values(seq_shop.nextval, 1,5,sysdate);
insert into cart1 values(seq_shop.nextval, 4,10,sysdate);
insert into cart1 values(seq_shop.nextval, 2,3,sysdate);
select * from cart1;

insert into cart2 values(seq_shop.nextval, 5,6,sysdate);
insert into cart2 values(seq_shop.nextval, 4,3,sysdate);
insert into cart2 values(seq_shop.nextval, 1,4,sysdate);
insert into cart2 values(seq_shop.nextval, 2,4,sysdate);
select * from cart2;

select * from shop;

--cart1에 담긴 상품을 shop테이블과 조인해서 자세히 출력해보기
select c1.idx,s.num,s.sangpum 상품명,s.color 색깔,c1.cnt 갯수,c1.guipday from shop s,cart1 c1 where s.num=c1.num;
