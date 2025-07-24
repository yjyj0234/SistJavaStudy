import React, { useState } from 'react'
import EightSubApp1 from './EightSubApp1';
import EightSubApp2 from './EightSubApp2';

 /*  color,message,photo
      1번째 자식이벤트
      1. color type=’color’ 색상선택시 변경
      2. message은 type=’text’입력시 변경
      3. photo select선택시 변경
      2번째 자식이벤트
      색상선택후 버튼클릭시 부모의 colorelt에 색상추가
 */
  
const EightApp = () => {
  //1번째  
  const [message,setMessage]=useState('오늘 과제는 리액트 이벤트입니다');
  const [photo,setPhoto]=useState('1');
  const [color,setColor]=useState('magenta');

  const changeAll = {
    message : setMessage,
    photo : setPhoto,
    color : setColor
  };
//name : 변수명, value : e.target.value
//name 에 변수명이 해당되면 value값 변경
//자식메서드 attr에 name값 넣기
  const changeHandler=(e)=>{
    const {name,value} = e.target;
    changeAll[name]?.(value);
  }
  
  //2번째
  const [colorelt,setColorelt]=useState(['pink','tomato','green','gray']);
  
  const addColorEvent=(co)=>{
    setColorelt(colorelt.concat(co));
  }
  /* const addCircle=(data)=>{
    setColorelt(prevColors=>[...prevColors, data]);
    
  } */
 const deleteCir=(idx)=>{
    setColorelt(colorelt.filter((item,i)=>(i!==idx)));
 }
  return (
    <div>
      <h2>EightApp_부모 자식 간 이벤트 과제</h2>    

      <br /><br />
      {/* 첫번째 자식 이벤트로 변경할 곳 */}
      <h3 style={{color:color}} >{message}</h3>
      <img src={`/image/연예인사진/${photo}.jpg`} alt="" style={{width:'300px'}}/>
      <br />
      {/* 두번째 자식 이벤트로 변경할곳 */}
      <br />
      {
        colorelt.map((col,idx)=>(<div style={{backgroundColor:col}} className='circle' onDoubleClick={()=>deleteCir(idx)}>{idx}</div>))
      }

      <br style={{clear:'both'}}/>
      <EightSubApp1  message={message} photo={photo} color={color} onChange={changeHandler}/>
      <br /><br />
      <EightSubApp2 onClick={addColorEvent}/>

    </div>
  )
}

export default EightApp
