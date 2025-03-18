--테이블 생성
-- CONSTRAINT sawon_ck_buseo check(buseo in('개발부','교육부','디자인부')),
create table sawon (num number(5)CONSTRAINT sawon_pk_num primary key,
name varchar2(20), gender varchar2(20),
buseo varchar2(20),pay number(10) default 1200000);

--alter로 제약조건 추가가능(부서명:개발부, 교육부, 디자인부)
alter table sawon add CONSTRAINT ck_sawon_buseo check(buseo in('개발부','교육부','디자인부'));

--제약조건 추가:남자 여자만 가능하다
alter table sawon add CONSTRAINT ck_sawon_gender CHECK(gender in('남자','여자'));

--시퀀스 새로 만들기
CREATE SEQUENCE seq_sawon nocache;

--데이터 추가
insert into sawon values(seq_sawon.nextval, '이승연', '남자','교육부',2500000);
--insert into sawon values(seq_sawon.nextval, '이승연', '남성','교육부',2500000); --'남자'가 아닌 '남성'이라서 체크에 위배
insert into sawon values(seq_sawon.nextval, '김민재', '남자','디자인부',2500000);
insert into sawon values(seq_sawon.nextval, '강호동', '남자','개발부',2500000);
insert into sawon values(seq_sawon.nextval, '이수근', '여자','디자인부',2500000);
insert into sawon values(seq_sawon.nextval, '이승기', '남자','교육부',2500000);
insert into sawon values(seq_sawon.nextval, '나피디', '여자','개발부',3000000);
insert into sawon values(seq_sawon.nextval, '은지원', '여자','디자인부',2000000);
insert into sawon values(seq_sawon.nextval, '이강인', '남자','개발부',3500000);
insert into sawon values(seq_sawon.nextval, '오타니', '남자','개발부',4250000);
insert into sawon values(seq_sawon.nextval, '조현우', '남자','교육부',2100000);

--수정
update sawon set buseo='교육부' where num=15;

--여러컬럼 수정 16번 부서:교육부 pay:2800000
update sawon set buseo='교육부',pay=2800000 where num=16;



--되돌리기
rollback;
--최종 저장
commit;

--그룹함수 사용
--부서별 인원수 최고급여 최저급여 조회
select buseo 부서명,count(*) 인원수, max(pay) 최고급여,min(pay) 최저급여 from sawon group by buseo;

--화폐단위 붙이고 천단위 구분기호(c 붙이면krw l붙이면 w)
select buseo 부서명,count(*) 인원수, to_char(max(pay),'L999,999,999') 최고급여,to_char(min(pay),'L999,999,999') 최저급여 from sawon group by buseo;

--인원수에 ~명 붙이기
select buseo 부서명,count(*)||'명' 인원수, to_char(max(pay),'L999,999,999') 최고급여,to_char(min(pay),'L999,999,999') 최저급여 from sawon group by buseo;

--성별 인원수와 평균급여,최고급여,최저급여를 구하시오
select gender,count(*),to_char(round(avg(pay),2),'c999,999,999'),to_char(max(pay),'L999,999,999'),to_char(min(pay),'l999,999,999') from sawon group by gender;

--부서별 인원이 3명이상인 경우에만 출력
select buseo 부서명,count(buseo) 인원수,avg(pay) 평균급여 from sawon group by buseo having count(buseo)>=3;

--제약조건 제거
--sawon 테이블의 sawon_ck_buseo를 제거해보기
alter table sawon drop CONSTRAINT ck_sawon_buseo;
--다른부서 추가해보기
insert into sawon values(seq_sawon.nextval, '이경영', '남자','본부',2100000);

select * from sawon;
commit;

--sawon에 name 컬럼에 unique제약조건 추가(sawon_uk_name)
--unique 는 하고나서 괄호에 name 써주기
alter table sawon add CONSTRAINT sawon_uk_name UNIQUE(name);

--name 컬럼에 중복이름 넣어보기
insert into sawon values(seq_sawon.nextval, '유민지', '여자','교육부',2800000);


--[JOIN]
--emp와 dept를 조인해서 emp사람들의 이름과 부서를 구하시오
select ename, deptno from emp;

select e.ename,d.dname --한쪽에만 존재하는 컬럼은 구분을 해줘도 안해줘도 되지만 양쪽에 존재하는 컬럼은 반드시 구분 필요
from emp e,dept d
where e.deptno=d.deptno; --foreign 키로 연결되어있다

--professor+department를 조인하여 다음과 같이 조회
--교수명 학과명 급여를 조회하시오
select name 교수명,dname 학과,pay
from professor p, department d
where p.deptno=d.deptno;

--emp에 dept에 없는 deptno를 삽입하거나 null 인서트 해보자
insert into emp(empno,ename,job,mgr,sal) values(7937,'KIM','MANAGER',7902,1200);
select * from emp;

--조인
select e.ename,d.dname 
from emp e,dept d
where e.deptno=d.deptno;
--null 값이 있는 kim, lee조회x, 만약에 null까지 조회하고 싶다면 outer join이용
select e.ename,d.dname 
from emp e,dept d
where e.deptno=d.deptno(+); 
--outer join을 할 컬럼에 괄호 +를 입력
--대상테이블에 값이 없어도 조회가 된다(NULL로)

--학생테이블 조회
--학번 학생이름 학년 제1전공
select s.studno 학번,s.name 학생이름,s.grade 학년, d.dname 제1전공, p.name 담당교수명
from student s, department d,professor p
where s.deptno1=d.deptno and s.profno=p.profno;

--panmae+product
--입고날짜 상품명 상품가격 입고갯수  총가격
--20240101 새우깡 800       3         2400

select p_date 입고날짜,p_name 상품명,p_price 상품가격, p_qty 입고갯수,p_total 총가격 from panmae p,product t
where p.p_code=t.p_code;

--(조인 연습용 테이블 생성하기)
create table food(foodnum number(3)primary key,
foodname varchar2(20),
foodprice number(7),
foodsize varchar2(20));

--nn:not null

create table booking(bnum number(3) CONSTRAINT pk_booking_bnum primary key,
bname varchar2(20) constraint nn_booking_bname not null,
bhp varchar2(20)CONSTRAINT uq_booking_bhp unique,
foodnum number(3),bday date, constraint fk_foodnum foreign key(foodnum) references food(foodnum)); --food에 있는 foodnum과 조인하기 위함

--food테이블에 메뉴 등록
insert into food values(100,'짜장면',9000,'보통');
insert into food values(101,'짬뽕',10000,'보통');
insert into food values(102,'중화비빔밥',9500,'보통');
insert into food values(103,'탕수육',18000,'보통');
insert into food values(104,'탕수육',23000,'대');
insert into food values(105,'짜장밥',11500,'곱배기');
insert into food values(106,'제육볶음',8500,'곱배기');

--시퀀스(booking에 쓸 용도)
create sequence seq_food start with 10 increment by 10 nocache;

--예약
--메뉴에 없는 foodnum을 넣으면 부모키가 없다는 제약조건위배가 나옴
insert into booking values(seq_food.nextval, '이영지','010-4454-3633',100,sysdate);
insert into booking values(seq_food.nextval, '송영주','010-9788-3521',102,sysdate);
insert into booking values(seq_food.nextval, '이영자','010-8544-9157',104,sysdate);
insert into booking values(seq_food.nextval, '이영애','010-2221-6665',103,sysdate);
insert into booking values(seq_food.nextval, '이영구','010-2099-2099',101,sysdate);

--inner join으로 예약손님 주문정보 확인
--주문자이름, 주문자 전화번호, 음식이름, 음식가격, 음식사이즈, 주문한 날짜
select bname 주문자이름,bhp 전화번호,foodname 음식이름,foodprice 음식가격,foodsize 음식사이즈, to_char(bday,'yyyy-mm-dd') 주문한날짜
from food f,booking b
where f.foodnum=b.foodnum;

--outer join을 이용해서 한번도 주문하지 않은 메뉴들을 알아보기
select f.foodnum,bname,foodname,foodprice,foodsize
from food f, booking b
where f.foodnum=b.foodnum(+); --이때 아무도 주문하지 않은 메뉴는 주문자가 null로 나온다

--위의 sql통해서 주문자 이름 빼고 null인 경우만 출력하면 아무도 주문하지 않은 메뉴만 골라낼 수 있음
select f.foodnum,foodname,foodprice,foodsize
from food f,booking b
where f.foodnum=b.foodnum(+) and bname is null;

--booking (자식테이블)에 추가된 메뉴를 food(부모테이블)에서 삭제할 수 있을까?
--자식 테이블 생성시 on delete cascade 설정을 안했을 경우 ..
delete from food where foodnum=101; --booking테이블에서 주문했으므로 101번은 못지움
--아무도 주문하지 않은 106번 지우기
delete from food where foodnum=106; --삭제됨(자식테이블에서 주문안했음)

--부모테이블 삭제
drop table food;--자식테이블이 먼저 삭제되어야 부모 테이블도 삭제 가능

--booking 먼저 지우고 food삭제 순으로 가야한다
drop table booking;
drop table food;
--시퀀스도 삭제
drop sequence seq_food;

select * from booking;
commit;
select * from food;

--db정규화
--한마디로 DB서버의 메모리를 낭비하지않기위해서
--어떤 테이블의 식별자를 가지는 여러개의 테이블로 나누는 과정
--정규화된 테이블은 중복이 최소화되도록 설계하는 데이타베이스

--수업과정
--1.일단 비정규화 테이블 _ 데이타를 추가하고 조회
--2. 1번을 2개의 테이블로 나누어서 외부키를 이용해 연결해본다
--3. 데이타 삭제시 정규화된 테이블의 경우 문제가 발생
 --  _cascade연산자를 이용해서 다시한번 테이블을 생성해보고 삭제연습

--비정규화 테이블
--회사직원 테이블:companysawon
--회사명:company 문자열(10)
--회사주소:address 문자열(20)
--회사전화:phone 문자열(15)
--직원명:sawon_name 문자열(15)
--직급:position 문자열(10)
--이메일:email 문자열(20)
--휴대폰:hp 문자열(20)
create table companysawon(company varchar2(10), address varchar2(20),phone varchar2(15),sawon_name varchar2(15), position varchar2(10), email varchar2(20),hp varchar2(20));
insert into companysawon values ('lg','서울시 강남구','02-124-5555','홍길동','사원','hkd@gmail.com','010-222-3333');
insert into companysawon values ('KT','서울시 역삼동','02-258-9999','김선동','대리','kkk@gmail.com','010-111-5555');
--거래처 회사에 대한 정보:거래처 직원을추가할 때마다 매번 추가
--메모리 낭비 심함
--만약 회사 이전, 승진 등등 정보가 바뀔 경우 많은 데이터를 한꺼번에 수정해줘야함
--그래서 정규화된 테이블정보로 수정이 필요함

--2. 정규화된 데이터 정보로 수정
--회사테이블:company
    --회사 ID나 number:company_id number(5) 기본키
    --회사명:
    --회사주소:
    --회사전화:
create table company(company_id number(5)primary key,
company varchar2(20),address varchar2(20),phone varchar2(20));

select * from company;
insert into company values(10,'KT','경기도 분당구','02-124-5555');
insert into company values(20,'LG','경기도 과천시','031-333-3131');
insert into company values(30,'SK','서울시 서초구','02-255-5522');
rollback;
--데이터를 추가하기 위한 사원테이블:sawon
    --직원명:
    --직급:
    --이메일:
    --휴대폰:
    --회사아이디: 외부키
create table sawon2(company_id number(5),
sawon_name varchar2(20),position2 varchar2(20),
email varchar2(20), hp varchar2(20),
CONSTRAINT sawon_fk_id foreign key(company_id) REFERENCES company(company_id));

--cascade
create table sawon3(company_id number(5),
sawon_name varchar2(20),position2 varchar2(20),
email varchar2(20), hp varchar2(20),
CONSTRAINT sawon3_fk_id foreign key(company_id) REFERENCES company(company_id)
on delete cascade);
--on delete cascade: 외부키로 연결되었다 하더라도 부모테이블의 데이터를 삭제하면 자식테이블의 데이터까지 자동으로 삭제시켜주는 기능