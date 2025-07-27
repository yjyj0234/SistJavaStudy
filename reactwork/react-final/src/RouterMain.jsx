import React from 'react'
import { About, Menu, Title, Main } from './components'
import { Route, Routes } from 'react-router-dom'
import Member from './member/Member'
import Login from './login/Login'
import Board from './board/Board'
import { Shop, ShopDetail, ShopForm } from './shop'

const RouterMain = () => {
  return (
    <div>
      <div><Title/></div>
      <div><Menu/></div>
      <div>
        <Routes>
            <Route path='/' element={<Main/>}/>

            {/* Shop */}
            <Route path='/shop/list' element={<Shop/>}/>
            <Route path='/shop/form' element={<ShopForm/>}/>
            <Route path='/shop/detail/:num' element={<ShopDetail/>}/>

            <Route path='/board/list' element={<Board/>}/>
            <Route path='/member/form' element={<Member/>}/>
            <Route path='/login' element={<Login/>}/>
            <Route path='/about' element={<About/>}/>
            <Route path='*' element={
                <div>
                    <h1>잘못된 주소입니다</h1>
                </div>
            }/>
        </Routes> 
      </div>
    </div>
  )
}

export default RouterMain
