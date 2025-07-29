import React from 'react'
import { NavLink } from 'react-router-dom'

const menu = () => {
  const myname = localStorage.getItem('myname'); 
  return (
    <ul className='menu'>
      <li><NavLink to='/'>Home</NavLink></li>
      {
      localStorage.getItem('loginok')==null?
      <li><NavLink to='/member/form'>Member</NavLink></li>
      :null
      }
      
      <li><NavLink to='/shop/list'>Shop</NavLink></li>
      <li><NavLink to='/board/list'>Board</NavLink></li>
      <li><NavLink to='/about'>오시는 길</NavLink></li>
      {/* 로그인인지 아웃인지 설정 */}
      {
        localStorage.getItem('loginok')==null?
        <li><NavLink to='/member/login'>로그인</NavLink></li>:
        <div>
          &nbsp;&nbsp;&nbsp;
          <b>{myname}님</b>&nbsp;&nbsp;
          <button type='button' className='btn btn-outline-danger'
          onClick={()=>{
            localStorage.removeItem('loginok');
            localStorage.removeItem('myid');
            localStorage.removeItem('mypass');
            window.location.reload();

          }}>로그아웃</button> 
        </div>

        
      }
    </ul>

  )
}

export default menu
