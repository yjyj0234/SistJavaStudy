--시퀀스: seq_food    1부터 3씩증가 캐시없음
--테이블명: FOODMENU(부모)
--시퀀스는 같아도 달라도 됩니다
--제약조건은 알아서 주시면 됩니다
--최소 데이타 5개이상 insert
--테이블명: FOODORDER(자식)
--:외부키는 foodmenu의 fno를 외부키로 설정(부모데이타 삭제시 자식데이타 자동삭제되도록)

create sequence seq_food start with 1 increment by 3 nocache;

create table FOODMENU(fno number(3)primary key,food_name varchar2(30),
price number(10),shop_name varchar2(20),loc varchar2(20)
);

drop table FOODMENU;
drop sequence seq_food;

insert into foodmenu values(seq_food.nextval, '알리오올리오',15000,'쏘렌토','역삼역 2번출구');
insert into foodmenu values(seq_food.nextval, '까르보나라',12000,'쏘렌토','강남역 3번출구');
insert into foodmenu values(seq_food.nextval, '토마토파스타',11000,'더양식','선릉역 4번출구');
insert into foodmenu values(seq_food.nextval, '먹물크림파스타',13000,'이탈리','강남역 1번출구');
insert into foodmenu values(seq_food.nextval, '반반파스타',15000,'양식왕','역삼역 2번출구');

--확인용
select * from foodmenu;
commit;

--자식
create table FOODORDER(sequen number(3)primary key,order_name varchar2(20),
fno number(5)CONSTRAINT order_fk_fno REFERENCES FOODMENU(fno) on delete cascade,
addr varchar2(30));
--constraint 를 뒤로 빼려면
--CONSTRAINT order_fk_fno foreign key(fno) REFERENCES FOODMENU(fno) on delete cascade

select * from foodorder;
insert into foodorder values(seq_food.nextval, '이영지',1,'역삼동');
insert into foodorder values(seq_food.nextval, '이영자',7,'서초동');
insert into foodorder values(seq_food.nextval, '이영구',13,'방배동');
insert into foodorder values(seq_food.nextval, '이경영',4,'대치동');
insert into foodorder values(seq_food.nextval, '이지영',4,'논현동');

select menu.fno 주문번호,order_name 주문자,food_name 음식명, price 가격, shop_name 상호명,
loc 가게위치, addr 주문자주소 from FOODMENU menu,FOODORDER ord where menu.fno=ord.fno 
order by order_name;
