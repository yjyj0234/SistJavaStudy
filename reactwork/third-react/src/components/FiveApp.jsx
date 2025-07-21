import React, { useState } from 'react'

function FiveApp() {
  const [review1,setReview1]=useState('eventimg4.jpg');
  const changeModel=(e)=>{
    setReview1(e.target.value);
  }
  const circles=['darkred','tomato','skyblue','gold','coral','lightgreen'];
  const cirColor= circles.map((circle)=>(<div className='circle' style={{background:circle}}></div>));
  const foodImgCount=12;
  const foods=Array.from({length:foodImgCount},(element,i)=>String(i+1));
  const foodimgs=foods.map((num)=>(<img src={`/Food/${num}.jpg`} className='food'/>))
  return (
    <div>
      <h2 className='alert alert-dnager'>FiveApp_복습</h2>
        {/* 1. Radio 클릭시 이미지 변경할것  (public이미지를 value로 할것_일부 or 경로포함전체)
        1~3제목은 <h2>로 하고 mui alert활용할것!!! */}
        <div className='input'>
          <input type="radio" value='eventimg4.jpg' defaultChecked
          onClick={changeModel} name='model'/>윈터&nbsp;
          <input type="radio" value='eventimg5.png'
          onClick={changeModel} name='model'/>카리나&nbsp;
          <input type="radio" value='eventimg2.jpg' 
          onClick={changeModel} name='model'/>모델&nbsp;
        </div>


        {/* 2. 색상6개를 배열선언후  동그라미 원안에 1~6까지를 각각의 색안에 출력하시오*/}
          {cirColor}

        {/* 3. public에 Food이미지를 넣고 1~12까지를 모두 출력하시오*/}

        <div className='output'>
              <img src={`/image2/${review1}`} style={{width:'200px'}}/>
        </div><br />
        <div>
          {foodimgs}
        </div>
          
    </div>
  )
}

export default FiveApp
