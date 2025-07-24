import React from 'react'
import { NavLink } from 'react-router-dom'

const menu = () => {
  return (
    <ul className='menu'>
      <li><NavLink to='/'>Home</NavLink></li>
      <li><NavLink to='/login'>Login</NavLink></li>
      <li><NavLink to='/member/form'>Member</NavLink></li>
      <li><NavLink to='/shop/list'>Shop</NavLink></li>
      <li><NavLink to='/board/list'>Board</NavLink></li>
      <li><NavLink to='/about'>오시는 길</NavLink></li>
    </ul>
  )
}

export default menu
