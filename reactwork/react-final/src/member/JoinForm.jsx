import axios from 'axios';
import React, { useState } from 'react'
import { useNavigate } from 'react-router-dom';

const JoinForm = () => {
    const [myname,setMyname]=useState('');
    const [myid,setMyid]=useState('');
    const [mypass,setMypass]=useState('');
    const [btnok,setBtnok]=useState(false); //중복체크버튼 클릭여부
    const [idmsg,setIdmsg]=useState(''); //아이디가능여부
    const navi=useNavigate();

    //아이디 중복체크
    const btnIdCheck=()=>{
        //localStorage: 브라우저에 저장하는 기능
      localStorage.setItem("url","http://localhost:8090");
      let url=localStorage.getItem("url")+"/member/idcheck?myid="+myid;
       
        axios.get(url)
        .then(res=>{
            if(res.data===0){
                setIdmsg("사용가능한 아이디입니다");
                setBtnok(true);
            }else{
                setIdmsg("가입 불가능합니다");
                setBtnok(false);
            }
        })
    }
    //아이디 입력시 호출
  const inputIdChange=(e)=>{
    setMyid(e.target.value);
    setBtnok(false);  //중복체크 후 아이디 다시 입력할 경우 때문에 추가
    setIdmsg('');
  }
  
  //회원 가입시 중복체크 없이 submit 방지
  const onSubmitButton =(e)=>{
    e.preventDefault(); //submit 방지(새로고침 방지 페이지만 유지)
    if(!btnok){
      alert('아이디 중복체크 해주세요');
      return;
    }else{
        const url="http://localhost:8090/member/insert";
        axios.post(url,{myname,myid,mypass})
        .then(()=>{
            navi('/member/list');
        })
    }
  }
  return (
    <div>
      <form onSubmit={onSubmitButton}>
        <table className='table table-bordered' style={{width: '500px', margin: 'auto'}}>
            <tbody>
                <tr>
                    <th>이름</th>
                    <td>
                        <input type="text" className='form-control' style={{width:'120px'}}
                        onChange={(e)=>setMyname(e.target.value)}/>
                    </td>
                </tr>
                <tr>
                    <th>아이디</th>
                    <td>
                        <div className='input-group'>
                        <input type="text" className='form-control' style={{width:'120px'}}
                        onChange={inputIdChange}/>&nbsp;
                        <button type='button' className='btn btn-outline-danger'
                        onClick={btnIdCheck}>중복확인</button>
                        </div>
                        <span style={{color:'red'}}>{idmsg}</span>
                    </td>
                </tr>
                 <tr>
                    <th>비밀번호</th>
                    <td>
                        <div className='input-group'>
                        <input type="password" className='form-control' style={{width:'120px'}}
                        onChange={(e)=>setMypass(e.target.value)}/>   
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colSpan={2}>
                        <button type='submit' className='btn btn-primary'>회원가입</button>
                    </td>
                </tr>
            </tbody>
        </table>

      </form>
    </div>
  )
}

export default JoinForm
