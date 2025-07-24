import React from 'react'
import { useNavigate } from 'react-router-dom'

const home = () => {
  const navi=useNavigate();
  return (
    <div className='home'>
       {/* 페이지 이동시: useNavigate */}
      <button type='button' className='btn btn-info'
      onClick={()=>{
        navi("/about");
      }}>About</button><br /><br />
      <button type='button' className='btn btn-info'
      onClick={()=>{
        navi("/about/제니");
      }}>About2</button><br /><br />
      <button type='button' className='btn btn-info'
      onClick={()=>{
        navi("/food/4/5");
      }}>점심메뉴</button>
    </div>
  )
}

export default home
