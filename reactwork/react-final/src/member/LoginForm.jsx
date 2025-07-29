import axios from 'axios';
import React, { useState } from 'react'
import { useNavigate } from 'react-router-dom';

const LoginForm = () => {
  const [myid, setMyid] =useState('');
  const [mypass,setMypass]=useState('');
  const navi=useNavigate();


  //submit 이벤트
  const onSubmitLogin=(e)=>{
    e.preventDefault();
    if(!localStorage.url){
      localStorage.setItem("url","http://localhost:8090");
    }
    let loginUrl=localStorage.url+"/login/check";
    //로그인 통신
    axios.post(loginUrl,{myid,mypass})
    .then(res=>{
      console.log(res.data.check);
      if(res.data.check===1){
        localStorage.loginok='yes';
        localStorage.myid=myid;
        localStorage.myname=res.data.myname;

        //일단 홈으로
        navi('/member/list');
        window.location.reload();
      }else{
        alert('아이디 또는 비밀번호가 맞지 않습니다');
        setMyid('');
        setMypass('');
      }
    })
  }

  return (

    <div className='login'>
      <form onSubmit={onSubmitLogin}>
        <table className='table table-bordered' style={{width: '600px'}}>
          <tbody>
          <tr>
            <th>아이디</th>
            <td>
              <input type="text" className='form-control' required autoFocus value={myid}
              onChange={(e)=>{
                setMyid(e.target.value);
              }}/>
            </td>
          </tr>
                  <tr>
            <th>비밀번호</th>
            <td>
              <input type="password" className='form-control' required autoFocus value={mypass}
              onChange={(e)=>{
                setMypass(e.target.value);
              }}/>
            </td>
          </tr>
          <tr>
            <td colSpan={2} align='center'>
              <button type='submit' className='btn btn-outline-info'>로그인</button>
            </td>
          </tr>
          </tbody>
        </table>
      </form>
    </div>
  )
}

export default LoginForm
