import axios from 'axios';
import React, { useEffect, useState } from 'react'

const MemberList = () => {
  //member useState
  const [member,setMember]=useState([]);

  //list 함수 정의 
  const memberList=()=>{
    const url=localStorage.url+"/member/list";
    axios.get(url)
    .then(res=>{
      console.log("회원목록:"+res.data)
        setMember(res.data);
    })
  }
  useEffect(()=>{
    memberList();
  },[])

  
  return (
    <div>
      <table className='table table-bordered' style={{width: '600px', margin: 'auto'}}>
        <tbody>
        <tr>
          <th width='80'>번호</th>
          <th>회원명</th>
          <th>아이디</th>
          <th>가입일</th>
          <th>밴</th>
        </tr>
       
         {member.map((row,idx)=>(
              <tr>
                <td>{idx+1}</td>
                <td>{row.myname}</td>
                <td>{row.myid}</td>
                <td>{row.gaipday}</td>
                <td>
                  <button className='btn btn-danger btn-sm' onClick={
                    ()=>{
                      const url=localStorage.url+"/member/delete?num="+row.num;
                      axios.delete(url)
                      .then(()=>{
                        alert('회원이 삭제되었습니다')
                        memberList();
                      })
                    }}>밴</button>
                </td>
              </tr>
            ) 

            )}
        </tbody>
      </table>
    </div>
  )
}

export default MemberList
