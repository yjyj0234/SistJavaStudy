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

--between, in


