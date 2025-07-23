import React, { useState } from 'react'

import Alert from '@mui/material/Alert';
import AddReactionIcon from '@mui/icons-material/AddReaction';
import SixSubApp from './SixSubApp';
import SixSubApp2 from './SixSubApp2';
import SixSubApp3 from './SixSubApp3';
function SixApp() {
    const [number,setNumber]=useState(0);
    //증가하는 이벤트 함수, 감소하는이벤트함수
    const numIncre=()=>{
        setNumber(number+1);
        }
    const numDecre=()=>{
        setNumber(number-1);
    }
  return (
    <div>
          <Alert icon={<AddReactionIcon fontSize="large" />} severity="success">
        <span style={{fontSize:'25px'}}>SixApp입니다_부모자식간 컴포넌트 통신</span>
        </Alert>
        <SixSubApp name="제니" age="22"/>
        <SixSubApp name="제니" age="22"/>
        <SixSubApp name="제니" age="22"/>
        <br /><br />
        <SixSubApp2 menu="짜장면" price="12000" linecolor="green"/>
        <SixSubApp2 menu="햄버거" price="11000" linecolor="pink"/>
        <SixSubApp2 menu="파스타" price="18000" linecolor="purple"/> 
        <br /><br />
        <h1>{number}</h1>
        <SixSubApp3 incre={numIncre} decre={numDecre}/>
    </div>
  )
}

export default SixApp
