import React, { useState } from 'react'

function ThirdApp() {
    //상태관리를 위한 변수 설정
    const [message,setMessage] =useState('Happy Day!!!');
    const [name,setName]=useState('홍길동');
    const [age,setAge]=useState('30');
    //이벤트 함수
    const handleEvent=(e)=>{
        if(e.key==='Enter'){
            setMessage('');
            e.target.value='';
        }
    }
  
  return (
    
    <div>
      <h2 className='alert alert-warning'>Third APP입니다</h2>
      <h3>{message}</h3>
      <hr/>
      <h4>
        메세지를 입력 해주세요
      </h4>
      <input type="text" style={{width:'300px',fontSize:'2em'}}defaultValue={message}
      onChange={(e)=>{
        setMessage(e.target.value);
      }}
      onKeyUp={handleEvent}
      />
    <h2>Q.버튼을 누르면 이름 나이를 본인거로 바꿔주세요</h2>
    <h5>이름: {name}</h5>
    <h5>나이: {age}</h5>
    <button type='button' className='btn btn-danger'
    onClick={(e)=>{

        setName('손현정');
        setAge('60');
    }}>변경</button>
    <button type='button' className='btn btn-dark'
    onClick={()=>{
        setName('홍길동');
        setAge(30);
    }}>초기화

    </button>
    </div>
  )
}

export default ThirdApp
