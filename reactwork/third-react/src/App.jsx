import { useState } from 'react'

import './App.css'
import OneApp from './components/OneApp';
import TwoApp from './components/TwoApp';
import ThreeApp from './components/ThreeApp';
import FourApp from './components/FourApp';
import FiveApp from './components/FiveApp';
import SixApp from './components/SixApp';

function App() {
  const [index,setIndex]=useState(2);
  return (
    <div>
        <b>컴포넌트 선택하기: </b>
        <select name="" id="" onChange={(e)=>{
          setIndex(Number(e.target.value))
        }}>
          <option value="1">OneApp확인</option>
          <option value="2">TwoApp확인</option>
          <option value="3">ThreeApp확인</option>
          <option value="4">FourApp확인</option>
          <option value="5">FiveApp확인</option>
          <option value="6">SixApp확인</option>
        </select>

      {index===1?<OneApp/>:index===2?<TwoApp/>:index===3?<ThreeApp/>:index===4?<FourApp/>:index===5?<FiveApp/>
      :<SixApp/>}

    </div>
  )
}

export default App
