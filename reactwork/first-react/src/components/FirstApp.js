import React from 'react'
import './mystyle.css'
import img1 from '../SemiImg/bigeventimg.jpg'
import img2 from '../SemiImg/eventimg4.jpg'
function FirstApp() {

    //스타일을 변수에 지정
    const styleimg1={
        width:'200px',
        border:'5px solid green',
        marginLeft:'100px'
    }

  return (
    <div>
      <h2 className='alert alert-info'>FirstApp입니다</h2>
      <h3 className='line'>오늘은 리액트 시작하는 날</h3>
        <div style={{fontSize:'25px',color:'green',marginLeft:'100px'}}>
            리액트 스타일 연습중
        </div>
    {/* 이미지 연습:src 영역은 반드시 import */}
        <div>
            <img src={img1} style={{width:'600px',borderRadius:'100px'}}></img>
            <img src={img2} style={{width:'600px',borderRadius:'100px'}}></img>
            <br /><br /><br />
            {/* public 영역의 이미지 가져오기 */}
            <img src='/logoImg/thor.png' style={{width:'200px'}}></img>
            <img src="../logoImg/a.png" style={styleimg1}/>
            
            
        </div>  
    </div>
  )
}

export default FirstApp
