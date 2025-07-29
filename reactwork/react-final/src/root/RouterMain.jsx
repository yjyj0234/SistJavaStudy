import React from 'react'
import { About, Menu, Title, Main } from '../components'
import { Outlet, Route, Routes } from 'react-router-dom'

import Login from '../login/Login'
import Board from '../board/Board'
import { Shop, ShopDetail, ShopForm } from '../shop'
import { JoinForm, LoginForm, MemberList } from '../member'

const RouterMain = () => {
  return (
    <div>
      <div><Title/></div>
      <div><Menu/></div>
      <div>
        <Routes>
            <Route path='/' element={<Main/>}/>

            {/* Shop _중첩라우트 사용시에는 index추가*/}
            <Route path='/shop'>
              <Route index element={<Shop/>}/>
            <Route path='list' element={<Shop/>}/>
            <Route path='form' element={<ShopForm/>}/>
            <Route path='detail/:num' element={<ShopDetail/>}/>
            </Route>

            <Route path='/board/list' element={<Board/>}/>
        {/* outlet의 뜻 : 중첩된 라우트를 렌더링하기 위한 자리
        부모 라우트가 고정된 레이아웃을 제공하고,
         그 레이아웃 안의 특정 영역에 자식 라우트의 내용이 동적으로 표시되도록 해줌 */}
            <Route path='/member' element={<Outlet/>}>
              <Route index element={<MemberList/>}/>
              <Route path='form' element={<JoinForm/>}/>
              <Route path='list' element={<MemberList/>}/>
              <Route path='login' element={<LoginForm/>}/>
            </Route>
            
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
