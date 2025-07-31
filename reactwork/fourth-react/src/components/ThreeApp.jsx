import React, { useState } from 'react'
import Alert from '@mui/material/Alert';
import AddReactionIcon from '@mui/icons-material/AddReaction';

const ThreeApp = () => {
    //객체 처리 변수
    const [inputs,setInputs]=useState({
        name:'홍길동',
        addr:'서울시',
        age:'20'
    })
    //3개 공통함수
    const changeData=(e)=>{
        console.log("name: "+e.target.name);
        console.log("value: "+e.target.value);

        //name.value값 얻기
        //e.target이 갖고있는 객체 한번에 변경하기
        const {name,value}=e.target;

        //변경
        setInputs({
            ...inputs, //기존의 멤버는 유지
            [name]:value //해당 값만 나오고 나머지는 사라진다. 해결방법은 펼침 연산자
        })
    }

  return (
    <div> <Alert severity='success'> <span style={{fontSize:'25px'}}></span></Alert>
    <h3 className='alert alert-info'>
        이름: <input type="text" name='name' defaultValue={inputs.name} onChange={changeData}/>
    </h3>
    <h3 className='alert alert-info'>
        주소: <input type="text" name='addr' defaultValue={inputs.addr} onChange={changeData}/>
    </h3>
    <h3 className='alert alert-info'>
        나이: <input type="text" name='age' defaultValue={inputs.age} onChange={changeData}/>
    </h3>
    </div>
    
  )
}

export default ThreeApp