import React, { useState } from 'react'
import './Mystyle.css'

function OneApp() {
    //초기상태는 '',0,0,0 으로 한다
    //값을 입력 후 바로바로 결과창에 출력한다
    //버튼 누르면 총점,평균 구하기
    const [name,setName]=useState('');
    const [java,setJava]=useState(0);
    const [spring,setSpring]=useState(0);
    const [react,setReact]=useState();
    const [sum,setSum]=useState(0);
    const [avg,setAvg]=useState(0);
   
  return (
    <div>
    

      <h2>OneApp_useState이용 상태변수 연습하기</h2>
        <div className='inp'>
            이름: <input type="text" style={{width:'100px'}}
            onChange={(e)=>{
                    setName(e.target.value);
            }}/> <br />
            자바점수: <input type="text" style={{width:'100px'}}
            onChange={(e)=>{
                    setJava(e.target.value);
            }}/><br />
            스프링점수: <input type="text" style={{width:'100px'}}
            onChange={(e)=>{
                    setSpring(e.target.value);
            }}/><br />
            리액트점수: <input type="text" style={{width:'100px'}}
            onChange={(e)=>{
                    setReact(e.target.value);
            }}/><br />
            <br />
            <button type='button' className='btn btn-primary'
            onClick={()=>{
                setSum(Number(java)+Number(spring)+Number(react));
                setAvg(Number(sum)/3);
            }}>결과 확인</button>
        </div>

        <div className='result'>
                이름:{name} <br />
                자바점수:{java}<br />
                스프링점수:{spring}<br />
                리액트점수:{react}<br />
                총점:{sum} <br />
                평균:{avg}
        </div>
    </div>
  )
}

export default OneApp