import React, { useState } from 'react'
import Alert from '@mui/material/Alert';
import AddReactionIcon from '@mui/icons-material/AddReaction';
import RowItemApp from './RowItemApp';
import WriteForm from './WriteForm';

function SevenApp() {
  const [board,setBoard]=useState([
    {

      name:"제니",
      photo:"22",
      mbti:"ENFJ",
      today:new Date()
    },
    {
      name:"지수",
      photo:"25",
      mbti:"INFJ",
      today:new Date()
    },
    {
      name:"로제",
      photo:"23",
      mbti:"ENFP",
      today:new Date()
    },
    {
      name:"리사",
      photo:"24",
      mbti:"ISFP",
      today:new Date()
    }
  ]);
  //데이터를 추가하는 함수이벤트
  //board를 바꾸면 렌더링이 다시 시작되면서 추가
  const dataSave=(data)=>{
    setBoard(board.concat({
        /* name:data.name,
        photo:data.photo,
        mbti:data.mbti */

        //데이터 유지
        ...data,
        today:new Date()
    }));
  }
  const handleDelete = (idx)=>{
    
    setBoard(board.filter((item,i)=>(i!==idx)));
  }
  return (
    <div>
      <Alert icon={<AddReactionIcon fontSize="large" />} severity="success">
        <span style={{fontSize:'25px'}}>SevenApp입니다_리스트 출력</span>
        </Alert>
        <br /><br />
        <WriteForm onsave={dataSave}/>
        <table className='table table-bordered' style={{width:'600px'}}>
          <caption align="top"><b>배열출력</b></caption>
          <thead> 
            <tr className='table table-secondary'>
            <th width="100">이름</th>
            <th width="100">사진</th>
            <th width="180">MBTI</th>
            <th width="100">날짜</th>
            <th width="100">삭제</th>
            </tr>
          </thead>
          <tbody>
            {
              //데이터 개수만큼 호출
              board.map((row,index)=>(<RowItemApp row={row} key={index} idx={index} onDelete={handleDelete}/>))
            }
          </tbody>
        </table>
    </div>
  )
}

export default SevenApp
