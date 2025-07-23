import React, { useEffect,useState } from 'react'
import Alert from '@mui/material/Alert';
import AddReactionIcon from '@mui/icons-material/AddReaction';

function OneApp() {
    const [count,setCount]=useState(0);
    const [message,setMessage]=useState('Hello');
    const [number,setNumber]=useState(100);
    //이벤트들
    const changeCount=()=>{
        setCount(count+1);
    }
    const changeNumber=()=>{
        setNumber(number+10);
    }
    const changeAll=()=>{
        setCount(count+1);
        setNumber(number+5);
    }
    const changeMessage=(e)=>{
        setMessage(e.target.value);
    }
   //useEffect는 여러번 정의가 가능하다
//    useEffect(()=>{
//     console.log("처음시작시,그리고 state값이 변경될때마다 무조건 호출");
//    })

  /*  useEffect(()=>{
    console.log("처음시작시 딱 한번만 호출");
   },[]) */

   useEffect(()=>{
    console.log("처음시작시 그리고 count값 변경시에만 호출된다");
    },[count])

//     useEffect(()=>{
//     console.log("처음시작시 그리고 count,number값 변경시에만 호출된다");
//    },[count,number])

//     useEffect(()=>{
//     console.log("처음시작시 그리고 message값 변경시에만 호출된다");
//    },[message])
 return (
    <div>
        <Alert icon={<AddReactionIcon fontSize="large" />} severity="success">
        <span style={{fontSize:'25px'}}>OneApp입니다_UseEffect</span>
        </Alert>
        {/*UseEffect_ 생성자처럼 한번만 호출될수도 있고 set이 연속적으로 들어가서 일부분만 랜더링이 될수도 있다  */}
    
       <button type='button' className='btn btn-info'
       onClick={changeCount}>Count만 증가</button>
       <button type='button' className='btn btn-info'
       onClick={changeNumber}>Number만 증가</button>
       <button type='button' className='btn btn-info'
       onClick={changeAll}>Count,Number 증가</button>

       <br/><br/>
       <b style={{fontSize:'4em'}}>{count}</b>
       <b style={{marginLeft:'30px',fontSize:'4em'}}>{number}</b>
       <hr/>
       <input type="text"  className='form-control'
       defaultValue={message}  onKeyUp={changeMessage}/>

       <h1>{message}</h1>
    </div>
  )
}

export default OneApp
