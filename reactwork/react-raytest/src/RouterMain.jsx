import React from 'react'
import Menu from './components/Menu'
import { Route, Routes } from 'react-router-dom'
import Home from './pages/Home'
import { About } from './pages'
import Food from './pages/Food'
import img1 from '/Food/10.jpg'

const RouterMain = () => {
  return (
    <div>
      {/* 모든페이지에서 공통으로 포함될 컴포넌트나 이미지 */}
      <h1 className='alert alert-warning title'>React Router 실습중</h1>
      <Menu/>
      <img src={img1} alt="" className='main_photo'/>
      <hr style={{clear:'both',marginBottom:'20px'}}/>
      <Routes>
        <Route path='/' element={<Home/>}/>
        <Route path='/about' element={<About/>}/>
        {/* about에 파라메터로 name을 넘기겠다 */}
        <Route path='/about/:name' element={<About/>}/>
        <Route path='/login/*' element={
          <div>
            <h1>로그인 기능은 아직 구현하기 전입니다</h1>
            <img src="/연예인사진/21.jpg" alt="" style={{width:'300px'}}/>
            <h3>죄송합니다.</h3>
          </div>
        }/>
        <Route path='*' element={
          <h1>잘못된 주소입니다</h1>
        }>
        </Route>
        <Route path='/Food/:food1/:food2' element={<Food/>}></Route>
      </Routes>

    </div>
  )
}

export default RouterMain
