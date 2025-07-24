import React from 'react'
import { NavLink } from 'react-router-dom'

const menu = () => {
  return (
    <div>
    <ul className='menu' >
      <li><NavLink to='/'>Home</NavLink></li>
      <li><NavLink to='About'>About</NavLink></li>
      <li><NavLink to='/about/lee'>about_Lee</NavLink></li>
      <li><NavLink to='/Food/10/11'>오늘의 점심메뉴</NavLink></li>
      <li><NavLink to='/Food/3/2'>오늘의 저녁메뉴</NavLink></li>
    </ul>
    
    </div>
  )
}

export default menu

