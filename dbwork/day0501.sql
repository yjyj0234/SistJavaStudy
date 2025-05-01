--Cursor:sql 문 실행할 때마다 명령이 분석되고 실행되어 결과 보관하기 위한 메모리 영역을
--사용하는데 이 영역을 참조하는 것(select문 에서 사용)

--커서 속성
--sql%rowcount : 실행된 행수 반환
--sql%found : 최근의 sql 문이 하나 이상의 행에 영향을 주었으면 true


--sql%notfound : 결과행이 없으면 true
--sql%isopen : 항상 false


/* 
    여러 레코드 출력
    Cursor 커서명
    is
    select 문장==>select 의 결과를 커서에 보관
    Cursor 출력
    loop 형식(커서를 open,close해주기)
    loop 
        fetch 커서명, into 변수명1,변수명2...
        exit when 커서명%not found; --결과데이타가 없을 때 true 빠져나감
    end loop;
    
    for 형식(Cursor 자동 open, close)
    for 레코드명 in 커서명 loop
        명령...;
    end loop;
*/

--sawon 테이블의 모든데이터를 출력

DECLARE
    CURSOR s1
    is
    select sname, sblood,sbirth from sawon;

    vblood sawon.sblood%type;
    
    vname sawon.sname%type;
    
    vbirth sawon.sbirth%type;
    
    BEGIN
        dbms_output.put_line('사원명 혈액명 생일');
        open s1;  --loop로 가지고 올 경우에만 open,close 필요
        loop
            FETCH s1 into vname,vbirth,vblood
            exit when s1%notfound; --더이상 데이터가 없으면 빠져나감
            dbms_output.put_line(vname ||   '   '|| vblood || '     '||vbirth);
        end loop;
        dbms_output.put_line('총' ||s1%rowcount ||'개의 데이터 조회 완료!!');
        close s1;
        END;
--sawon 테이블의 모든 데이타를 출력 --for문으로 변경해서 출력

/--p1/sql 블록 실행

--sawon 테이블의 모든 데이터를 출력 --for문으로 변경해서 출력
DECLARE
 CURSOR s1
 is
 select * from sawon;
 
 BEGIN
 dbms_output.put_line('사원명   부서명    급여');
 for s in s1 loop
  exit when s1%notfound;
  dbms_output.put_line(s.sname||'  '||s.sblood||'   '||s.sbirth);
  END loop;
  END;
  /
  
  --프로시저 
  --반복되는 코드를 프로시져에 저장해두었다가 호출해서 실행만 해서 쓰는 재사용량이
  --높은 객체이다
  
  /*
    형식
    create [or replace] procedure 프로시져명
    is
        변수선언
        begin
         코드;
         end;
         호출: exec프로시져명
  */
  
  --간단 프로시져
  create or replace procedure mytest
  is
  begin
    dbms_output.put_line('첫 프로시져 만들어봤어요~~');
    end;
    /
    exec mytest;
    
    
    
  
