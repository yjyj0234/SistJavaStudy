--[복습]
--emp_사원명이 A로 시작하는 사람의 이름과 직업 급여를 조회
select ename,job,sal from emp where ename LIKE 'A%';

--emp 급여가 평균보다 더 높은사람만 사원명 급여 조회
select ename,sal
from emp
where sal>(select avg(sal) from emp);

--emp_입사일이 12월인 사람만 사원명 입사일 조회
select ename Hiredate from emp where to_char(hiredate, 'mm')='12';

--student 에서 deptno1 전공이 101인 학과의 평균몸무게보다 몸무게가 많은 학생의 이름과 몸무게 조회
select name,weight
from student
where weight>(select avg(weight) from student where deptno1=101);

--professor_심슨교수와 같은 입사일에 입사한 교수 중에서 조인형 교수보다 월급을 적게 받는 교수의 이름,급여,입사일 조회
select name,pay,hiredate
from professor
where hiredate=(select hiredate from professor where name='심슨')
and pay<(select pay from professor where name='조인형');

--(그룹함수) Group By절_특정조건으로 세부적인 그룹
--professor_ 에서 학과별로 교수들의 평균급여 조회
select deptno,avg(pay) "평균 급여" from professor group by deptno;
--professor_ 에서 직급별로 교수들의 총급여 조회
select position,sum(NVL(pay,0)) "총급여" from professor group by position;
--professor_학과별, 직급별 교수들의 평균급여
select deptno,position, avg(pay) from professor group by deptno,position;

--직급별 평균보너스
select position, avg(NVL(bonus,0)) from professor group by position;

--student_ 학년별 평균키와 최고몸무게 조회
select grade,avg(height),max(weight) from student group by grade;

--professor_직급별 평균 급여와 최고 보너스를 구하시오
select position,round(avg(nvl(pay,0)),1),max(nvl(bonus,0)) from professor group by position;

--emp_job 별로 sal의 최대값과 최소값
select job, max(sal), min(sal) from emp group by job;

--emp_job 별로 인원수 조회
select job, count(*) from emp group by job;

--Having절_ 그룹내에서 조건을 주고 검색시 반드시 group by 뒤에
--평균급여가 3000이상인 부서(dept)의 부서번호와 평균급여를 구하시오
select deptno, round(avg(NVL(sal,0)),2) from emp group by deptno having avg(sal)>2000;
--where 절은 그룹함수 비교조건으로 쓸 수 없다

--professor_평균급여가 450이상인 학과의 학과번호와 평균급여를 구하시오
select deptno, avg(pay) from professor group by deptno having avg(pay)>450;

--emp_job 별로 직원 수가 2명이상인 경우의 부서를 조회하시오
select job,count(*) from emp where deptno IN(10,20,30) group by job having count(*)>=2 order by count(*) desc;

--emp_평균급여가 5000이상인 job별로 급여의 합계 조회하되 MANAGER는 제외하고 조회하되 단 급여가 많은순서대로 조회할것
select job, sum(sal) from emp 
where job not in ('MANAGER') 
group by job having sum(sal)>=5000 
order by sum(sal) desc;  --총급여 내림차순




--[DDL] & [DML]
--테이블 생성
create TABLE test(num number(5) primary key,name varchar2(20),score number(6,2),birth date);


--test에 insert
--전체 데이타
insert into test values(1,'이상민',88.88,'1997-10-25');
--일부데이타
insert into test(num,name) values (2,'강민주');

--전체데이터 조회
select *from test;

--일부컬럼
select name from test;

--데이터 더 추가 (sysdate)
insert into test values(3,'손흥민',89.8,sysdate);

--무결성 제약조건 오류가 난다(num이 기본키 이므로 같은값 넣을수 없음
insert into test values(2,'손흥민',77,sysdate);

--나이를 저장할 컬럼 추가.. 기존의 추가 못한 값은 모두null로 추가
alter table test add age number(5);

--주소를 저장할 컬럼 추가..초기값을 강남구로 지정
alter table test add addr varchar2(30)default '강남구';
--주소 문자타입 30==>50으로 변경
alter table test modify addr varchar2(50);

--구조를 확인시켜줌
desc test;

--나이에 문자 10으로 변경하고 기본값을 20으로 변경
alter table test modify age varchar2(10) default '10';

--추가
insert into test values(4,'지니',77.5,sysdate,'21세','서울시 강서구');
insert into test(num,name,addr) values(5,'미숙','부산시 사하구');

--num 오름차순
select * from test order by num desc;

--age 컬럼 삭제
alter table test drop column age;

--addr 삭제
alter table test drop column addr;

--score 을 jumsoo로 컬럼 변경
alter table test rename column score to jumsoo;
--birth-->birthday로 컬럼 변경
alter table test rename column birth to birthday;

drop table test;

--[시퀀스]
--유일한(UNIQUE) 값을 생성해주는 객체
--시퀀스를 생성하면 기본키처럼 순차적으로 증가하는 컬럼을 자동으로 생성가능
--primary key를 생성하기 위해 사용

--기본 시퀀스 생성 1부터 1씩 증가
create sequence seql;

--전체 시퀀스 확인
select * from seq;

--다음시퀀스 값을 발생시켜 콘솔(dual)에 출력
select seql.nextval from dual;

--현재 마지막값 발생 시퀀스
select seql.currval from dual;

--시퀀스 삭제
drop sequence seql;



---10부터 5씩 증가하는 시퀀스 생성 캐쉬 없애기
create sequence seq1 start with 10 increment by 5 nocache;

--시퀀스 발생
select seq1.nextval from dual;

--시퀀스 수정(10씩 증가, 최대 100 사이클)
alter sequence seq1 increment by 10 maxvalue 150 cycle;

--시퀀스 삭제
drop sequence seq1;

--seq1 시작값 5 증가값 2 캐시:no 사이클:yes
create sequence seq1 start with 5 increment by 2 maxvalue 30 nocache cycle;
--seq2 시작값 2 증가값 2 캐시:no
create sequence seq2 start with 1 increment by 2 nocache;

--출력
select seq1.nextval,seq2.nextval from dual;

drop sequence seq2;




----------------------------------------------------------------------
--시퀀스 생성
create sequence seq1 nocache;
--테이블 생성
-----------varchar가변 문자열 20개 
create table info(num number(5) primary key,name varchar2(20),job varchar2(30), gender varchar2(10), age number(5), hp varchar2(20),birth date);

--birth->ipsaday 로 변경
alter table info rename column birth to ipsaday; 

--조회 연습 위해서 10개이상 insert job(프로그래머, 교사, 엔지니어)
insert into info values(seq1.nextval,'현승윤','프로그래머','남',26,'010-1244-3242','2024-10-01');
insert into info values(seq1.nextval,'김연아','교사','여',30,'010-2364-3578','2024-10-31');
insert into info values(seq1.nextval,'김영광','엔지니어','남',32,'010-8657-5377','2023-12-11');
insert into info values(seq1.nextval,'박해진','엔지니어','남',35,'010-7677-1237','2023-10-01');
insert into info values(seq1.nextval,'김혜수','프로그래머','여',40,'010-8857-1310','2020-12-11');
insert into info values(seq1.nextval,'제이슨','교사','여',28,'010-9493-8805','2024-10-01');
insert into info values(seq1.nextval,'박지성','프로그래머','남',36,'010-9453-5355','2022-12-11');
insert into info values(seq1.nextval,'이대호','선수','남',50,'010-8657-5377','2020-12-11');
insert into info values(seq1.nextval,'김혜수','프로그래머','여',40,'010-8857-1310','2020-12-11');
insert into info values(seq1.nextval,'이주연','엔지니어','여',34,'010-6007-4058','2023-10-01');
insert into info values(seq1.nextval,'안영미','프로그래머','여',32,'010-6004-1014','2024-10-01');

--commit 하기(최종 저장)
commit;

--최종 인원 확인
select count(*) from info;

--나이 역순으로 조회
select * from info order by age desc;
--컬럼명 대신 컬럼 번호를 써도 된다
select * from info order by 5 desc;

--성별 오름차순 같을 경우 이름의 내림차순
select * from info order by gender asc, name desc;

--어떤직업이 있는지 직업만 출력
select distinct job from info;

--성이 김씨만 조회
select * from info where name like '김%';

--핸드폰이 010인 사람만 조회
select * from info where hp like '010%';

--10월에 입사한 사람만 조회
select * from info where to_char(ipsaday, 'MM')='10';

--입사년도가 2022년도인 사람 조회
select * from info where to_char(ipsaday, 'yyyy')='2022';

--나이가 30~40 사이 출력(2가지 방법 between and)
select * from info where age between 30 and 40;
select * from info where age>=30 and age<=40;

--직업이 교사이거나 엔지니어인 사람 조회(2가지)
select * from info where job in('교사','엔지니어');
select * from info where job='교사' or job='엔지니어';

--교사,엔지니어만 제외한 직업 조회
select * from info where job not in('교사','엔지니어');

--문제
--성이 이씨이거나 최씨인 사람 조회
select * from info where name like '이%' or name like '최%';
--여자이면서 나이가 30 이상 조회
select * from info where gender='여' and age>=30;
--남자들 평균 나이 구하기(소수점 1자리)
select round(avg(age),1) from info where gender='남';
--성별 평균 나이
select gender, round(avg(age),1) from info group by gender;
--평균나이보다 많은 사람의 이름과 직업 나이를 출력(서브쿼리)
select name,job,age from info
where age>(select avg(age) from info);
--4월이나 10월에 입사한 사람 조회
select * from info where to_char(ipsaday, 'MM')=04 or to_char(ipsaday, 'MM')=10;

--테이블 복사본 생성하기
create table info2 as select * from info;

--info 3번의 직업과 나이 수정.. 주의) 조건을 안쓰면 전체 데이터 수정
update info set job ='간호사',age='29';

--잘못수정한 데이터 원래대로 되돌리기(commit 하기전에만 가능)
ROLLBACK;

--info 5번 직업 나이 수정
update info set name='김지수',job='연극배우',age='22',hp='010-5474-3342'where num=5;

--info 중 박씨이면서 엔지니어인 사람의 성별 여자로 변경
update info set gender='여' where name like '박%' and job like '엔지니어';

--num이 8번인 사람의 직업을 유튜버, 입사일을 24-12-25로 수정하기
update info set job='유튜버',ipsaday='24-12-25' where num=8;

--최종 저장
commit;
--항상 마지막에 둬서 확인하기
desc info;
select * from info;

--info2
--num이 5번인사람 삭제
delete from info2 where num=5;

--여자이면서 나이 30이상 모두 삭제
delete from info2 where gender='여' and age>=30;

--7번이면서 핸드폰 끝자리가 55인 사람을 삭제하시오
delete from info2 where num=7 and hp like '%__55';
--직업이 교사이거나 프로그래머인 사람 모두 삭제
delete from info2 where job in ('교사','프로그래머');
delete from info2 where job='교사' or job='프로그래머';

--컬럼추가하는데 주소addr 30바이트로 추가
alter table info2 add addr varchar(30);
--컬럼명 변경 hp-->handphone
alter table info2 rename column HP to handphone;

--데이터 추가하는데 num, name, gender, job, addr만 넣기
insert into info2(num, name,gender,job,addr) values (seq1.nextval,'이현아','여','알바','서울시');
--핸드폰이 null이 아닌사람만 조회
select * from info2 where handphone is not null;

--null일 경우 age는 20, 핸드폰은 *** 이름,직업,나이,핸드폰을 출력하시오
select name,job,nvl(age,20),nvl(handphone,'***-****-****') from info2;



--Rollup 함수
--자동으로 소개(정교수는 페이 얼마 조교수는 페이 얼마인지)/합계를 구해주는 함수
--groupby절에 주어진 조건으로 소계 구해준다
SELECT
    STUSCORE.BAN,
    total,
    SUM(total), -- 해당 그룹의 총점 합계 (ROLLUP에 의해 총계가 나옴)
    AVG(total)  -- 해당 그룹의 총점 평균
FROM
    stuscore
GROUP BY
    STUSCORE.BAN,
    ROLLUP(total);

--cube 전체 총합계 까지 출력하려면 rollup처럼 각 소계에 총계까지 
select deptno, count(*),sum(pay) from professor group by cube(deptno);

--emp에서 직업별 인원수 최대급여 최소급여 구하세요
select job,count(job),max(sal),min(sal) from emp group by job order by job;

--emp에서 부서번호, 인원수,급여평균, 급여의 합 조회
select deptno,count(*) 인원수, round(avg(sal),2) 급여평균, sum(sal) 급여합계 from emp group by rollup(deptno);

--입사년도별 인원수,sal의 평균(소수점없이) 출력하되 입사년도의 오름차순
select to_char(hiredate,'yyyy') 입사년도,count(hiredate) 인원수,round(avg(sal),0) 평균연봉 from emp group by to_char(hiredate,'yyyy') order by to_char(hiredate,'yyyy');

--DML-DEPARTMENT에 정보 넣기
--102 유아교육과 200 넣는건 자유
--103 미술교육과 400
--201 영문학과 500
--202 국문학과 600

insert into DEPARTMENT(deptno,dname,part) values (102,'유아교육과',200);
insert into DEPARTMENT(deptno,dname,part) values (103,'미술교육과',400);
insert into DEPARTMENT(deptno,dname,part) values (201,'영문학과',500);
insert into DEPARTMENT(deptno,dname,part) values (202,'국문학과',600);
select * from department;

--professor에 데이터 입력
--5001,손흥민,loveme,정교수,500,sysdate,보너스 없음,deptno 301
insert into professor (profno,name,id,position,pay,hiredate,deptno) values (5001,'손흥민','loveme','정교수',500,sysdate,301);


--조교수들의 보너스를 일괄 100만원으로 인상해주세요
update professor set bonus=100 where position='조교수';

--손흥민교수와 동일한 직급을 가진 교수들 중 500이 안되는 교수들의 급여를 15% 인상하세요
update professor set pay=pay*1.15 where position =(select position from professor where name= '손흥민')
 and pay<500;
select * from professor;

--dept2 에서 Dcode가 1001번~1009사이의 매장들을 모두 삭제해주세요
delete from dept2 where dcode between 1001 and 1009;
select * from dept2;

--alter 테이블의 구조변경
--dept2를 복제 하여 dept3를 만들어주세요
create table dept3 as select * from dept2;

--dept3에 loc를 추가하고 기본값으로 대한민국으로 넣어주세요
alter table dept3 add loc varchar2(20)default'대한민국';
--포항본사의 loc를 포항시청앞으로 수정해주세요
update dept3 set loc='포항시청앞' where area='포항본사';

update dept3 set loc='광화문' where area='서울지사';
update dept3 set loc='현대제철' where dcode=1011;
--
select * from dept3;

--emp 테이블에 totSal 열을 하나 더 추가해주세요 number(20);
alter table emp add totSal number(20);
--sal+com을 더해서 데이터를 추가해주세요
update emp set totsal=sal+nvl(comm,0);

--totsal 컬럼 삭제 alter table emp drop column totsal;
--
select * from emp;