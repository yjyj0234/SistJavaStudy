import React, { useRef, useState } from 'react'
import Alert from '@mui/material/Alert';
function FiveApp() {
    //useref 변수 관리하는 기능
    //state와의 차이점: 값이 변경되어도 다시 렌더링 하지 않는다
    //state 기능이 있는 버튼을 누르면 useref변수도 같이 렌더링
    const [count,setCount]=useState(0);
    //ref 선언
    const countRef=useRef(0);
    console.log("렌더링 중...");

    //state 변수 증가하는 함수
    const stateIncre=()=>{
        setCount(count+1);
    }
    //ref변수 증가하는 함수
    const refIncre=()=>{
        countRef.current=countRef.current+1;  
        console.log("countRef: "+countRef.current);
    }
    //점수 입력 예제
    const [result,setResult]=useState('');
    const nameRef=useRef('');
    const javaRef=useRef(0);
    const oracleRef=useRef(0);
    const reactRef=useRef(0);

    //버튼이벤트
    const buttonResult=()=>{
            //데이터 읽어오기
            let name=nameRef.current.value;
            let java=Number(javaRef.current.value);
            let oracle=Number(oracleRef.current.value);
            let react=Number(reactRef.current.value);

            let tot=java+oracle+react;
            let avg=(tot/3).toFixed(2);

            let s=`[결과확인]
            이름:${name}
            자바점수:${java}
            오라클점수:${oracle}
            리액트점수:${react}
            총점:${tot}
            평균:${avg}`;
        
            setResult(s);
            
    }

  return (
    <div><Alert severity='success'><span style={{fontSize:'25px'}}>FiveApp입니다_useRef</span></Alert>
    <br /><br />
    <button type='button' className='btn btn-outline-success' onClick={stateIncre}>state변수증가</button>
    <h1>{count}</h1>
    <button type='button' className='btn btn-outline-danger' onClick={refIncre}>ref변수증가</button>
    <h1>{countRef.current}</h1>
      <hr />
      
      <div>
        <h2 className='alert alert-info'>useRef 예제</h2>
        <h4>이름 입력: <input type="text" ref={nameRef}/></h4>
        <h4>자바 점수: <input type="text" ref={javaRef}/></h4>
        <h4>오라클 점수: <input type="text" ref={oracleRef}/></h4>
        <h4>리액트 점수: <input type="text" ref={reactRef}/></h4><br />
        <button type='button' className='btn btn-danger'
        onClick={buttonResult}>
            결과확인
        </button><br /><br />
        <h2 className='alert alert-danger'>{result}</h2>
      </div>
    </div>
  )
}

export default FiveApp
