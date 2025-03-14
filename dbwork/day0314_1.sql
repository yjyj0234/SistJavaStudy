--emp로 연습
--사원번호, 사원명, 직업, 급여를 조회하고 사원명의 오름차순으로 조회하시오
select empno, ename, job, sal from emp order by ename ;
--모든열 조회하고 sal의 내림차순 조회하시오
select * from emp order by sal desc;
--jop 컬럼의 데이타중 중복데이타는 한번만 출력하시오
select DISTINCT job from emp;

--where 절
--산술연산자
select * from emp;
--사원명,급여,특별보너스(급여+100)을 조회하시오
select ename 사원명,sal as 급여, sal+100 "특별보너스" from emp;

--급여가 3000이상인 큰사람의 이름과 급여를 조회하시오
select ename 이름, sal 급여 from emp WHERE sal>=3000;

--사원명이 스코트인 사람의 사원번호, 급여를 조회하시오(소문자 대문자 정확하게 해야함)
select empno 사원번호, sal 급여 from emp where ename='SCOTT';

--where절 이용한 Student테이블
select * from student;

--학생중 키가 170이상인 학생의 학번과 이름과 키를 조회하시오
select studno 학번,name 이름,height as 키 from student where height>=170;

--between(작은것에서 큰것), in(여러개 값을 동시 비교해서 일치하는 데이터 얻을 때)
--in 연산자
--deptno1이 101 102인 학생명,학년,deptno1 조회할것
select name 학생명, grade as 학년,deptno1 from student where deptno1 in(101,102);
--몸무게가 60~80 사이인 학생의 이름 몸무게 조회하시오
select name, weight from student where weight between 60 and 80;

--like 연산자
--성이 김씨인 학생의 이름과 학년을 조회하시오
select name, grade from student where name LIKE '김%';

--professor에서 보너스가 null값인 교수명 보너스만 출력
select * from professor;
select name,bonus from professor where bonus is Null;

--professor에서 보너스가 null이 아닌 교수명 보너스만 출력
select name,bonus from professor where bonus is not Null;

--NVL(mysql에서의 IFNULL)
--NVL(null인곳 0으로 바꿈)
select empno,NVL(comm,0) from emp where deptno=30;

--emp에서 급여,급여*12,보너스,급여*12+보너스(총연봉)
select ename 사원명, sal 급여,sal*12 연봉,NVL(comm,0) 보너스 ,sal*12+NVL(comm,0) 총연봉 from emp;

--emp에서 급여가 1500이상 4000이하인 사람의 사원번호,사원명 급여 구하시오
select empno 사원번호, ename 사원명, sal 급여 from emp where sal between 1500 and 4000;

--입사일이 1981/01/01/ 과 1991/12/31/사이에 입사한 사람의 이름과 급여를 구하시오
select ename 사원명, sal 급여,hiredate 입사일 from emp where hiredate >= '1981/01/01' and hiredate <='1991/12/31';
--직업이 MANAGER,ANALYST,CLERK인 사람의 사원명, 직업을 구하시오
select ename 사원명, job 직업 from emp where job = 'MANAGER' or job= 'ANALYST' or job='CLERK';
--학생테이블에서 이름이 수로 끝나는 사람의 이름과 학년을 구하시오
select name 이름, grade 학년 from student where name like '__수%';

--LIKE연산자에서는 언더바(_) 하나가 하나의 문자를 대체
--2번째이름의 철자가 A인사람의 사번, 이름, 입사일, 급여조회
select empno,ename,hiredate,sal from emp where ename Like'_A%';
--3번째이름의 철자가 N인사람의 사번, 이름, 입사일, 급여조회
select empno,ename,hiredate,sal from emp where ename Like'__N%';

--AND OR
--직업이 MANAGER이고 부서번호가 10번인 사원의 사번, 사원명, 직업, 부서번호를 조회하시오
select empno,ename,job,deptno from emp where deptno=10 AND job='MANAGER';

--입사일이 1982/01/01 이전에 입사했거나 직업이 MANAGER인 사원의 사번, 사원명, 직업, 입사일을 조회하시오
select empno,ename,job,hiredate from emp where hiredate<='1982/01/01' or job='MANAGER';

--다중정렬
--직업의 오름차순,급여의 내림차순으로 사원명,직업,급여를 구하시오
select ename,job,sal from emp order by job asc,sal desc;
--학생테이블에서 1학년 학생의 이름과 키와 몸무게를 구하시오. 단, 키는 작은사람부터,몸무게는 많은사람부터 정렬출력할것
select name 이름,height 키, weight 몸무게 from student where grade='1' order by height asc,weight desc;

--Q
--학생테이블에서 몸무게가 80이상인 학생,키,몸무게를 조회하되 4학년부터 1학년순서로 조회한 후 몸무게가 적은사람부터 조회할것
select name 이름, height 키,weight 몸무게,grade 학년 from student order by grade desc, weight;

--학생테이블에서 생일이 1975/01/01 이후인 학생의 학생명,학년,생일을 조회하되 생일의 내림차순 조회하시오
select name 학생명,grade 학년,birthday 생일 from student where birthday>='1975/01/01' order by birthday desc;