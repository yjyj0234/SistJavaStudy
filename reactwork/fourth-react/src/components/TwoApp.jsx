import React, { useEffect, useState } from 'react'
import Alert from '@mui/material/Alert';
import AddReactionIcon from '@mui/icons-material/AddReaction';

function TwoApp() {
    const [count,setCount]=useState(1);
    const [visible,setVisible]=useState('visible');

    //count 값 변경될 때만 호출
    useEffect(()=>{
        setVisible(count%3==0?'visible':'hidden');
    },[count])
  return (
    <div>
          <Alert icon={<AddReactionIcon fontSize="large" />} severity="success">
        <span style={{fontSize:'25px'}}>TwoApp입니다_3의 배수일때만 이미지가 보여지게</span>
        </Alert>
                <button type='button' className='btn btn-danger'
        onClick={()=>{
            setCount(count+1);
        }}>count증가</button>

         <h1>{count}</h1>

         <img src="/image/Food/1.jpg" alt="" 
         style={{visibility:visible,width:'300px'}}/>

    </div>
  )
}

export default TwoApp
