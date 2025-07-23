import { useState } from 'react'
import OneApp from './components/OneApp';
import TwoApp from './components/TwoApp';
import ThreeApp from './components/ThreeApp';
import FourApp from './components/FourApp';
import FiveApp from './components/FiveApp';
import SixApp from './components/SixApp';
import SevenApp from './components/SevenApp';
import EightApp from './components/EightApp';
import './App.css'
import NineApp from './components/NineApp';

function App() {
  const [index,setIndex]=useState(2);

  return (
    
      <div>
         <b>컴포넌트 선택하기: </b>
       <select onChange={(e)=>{
        setIndex(Number(e.target.value))
       }}>
           <option value="1">OneApp 확인</option>
           <option value="2">TwoApp 확인</option>
           <option value="3">ThreeApp 확인</option>
           <option value="4">FourApp 확인</option>
           <option value="5">FiveApp 확인</option>
           <option value="6">SixApp 확인</option>
           <option value="7">SevenApp 확인</option>
           <option value="8">EightApp 확인</option>
           <option value="9">NineApp 확인</option>
       </select><br/><br/>


      {index===1?<OneApp/>:index===2?<TwoApp/>:index===3?<ThreeApp/>:index===4?<FourApp/>:index===5?<FiveApp/>:index===6?<SixApp/>:index===7?<SevenApp/>:index===8?<EightApp/>:<NineApp/>}

      
    </div>
  )
}

export default App
