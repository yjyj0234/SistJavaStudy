import React from 'react'
import { useNavigate, useParams } from 'react-router-dom'

const Food = () => {
    const {food1, food2}=useParams();
    const navi=useNavigate();
  return (
    <div>
        <h1>오늘의 점심메뉴</h1>
         <button type='button' className='btn btn-info'
         onClick={()=>{
            navi(-1);
         }}>이전페이지</button><br /><br />

        <img src={`/Food/${food1}.jpg`} alt="" style={{width:'200px'}}/>
        <img src={`/Food/${food2}.jpg`} alt="" style={{width:'200px'}}/>
    </div>
  )
}

export default Food
