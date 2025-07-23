
import React, { useState } from 'react'
import Alert from '@mui/material/Alert';
import AddReactionIcon from '@mui/icons-material/AddReaction';


const FourApp = () => {


  const [boards]=useState([

     {
       num:1,
       writer:'제니',
       subject:'hello jenny',
       photo:'11'
     },
     {
       num:2,
       writer:'지수',
       subject:'hello jeesoo',
       photo:'12'
     },
     {
       num:3,
       writer:'로제',
       subject:'hello rojee',
       photo:'13'
     },
     {
       num:4,
       writer:'리사',
       subject:'hello lisa',
       photo:'15'
     }

  ]);

     

  return (
    <div> <Alert icon={<AddReactionIcon fontSize="large" />} severity="success">
        <span style={{fontSize:'25px'}}>FourApp입니다_배열안에 객체출력</span>
        </Alert><br/><br/>
        <table className='table table-bordered' style={{width:'600px'}}>
          <thead>
             <tr className='table-info'>
              <th width='80'>번호 </th>
              <th width='100'>이미지 </th>
              <th width='300'>제목 </th>
              <th width='100'>작성자 </th>
             </tr>
          </thead>
          <tbody>
            {
              boards.map((row,index)=>(
                <tr key={index}>
                  <td>{row.num}</td>
                  <td> <img src={`/image/연예인사진/${row.photo}.jpg`} alt=""  style={{width:'50px'}}/> </td>
                  <td>{row.subject}</td>
                  <td>{row.writer}</td>
                </tr>
              ))

            }
          </tbody>

        </table>
       
        
        
        </div>
        
  )
}

export default FourApp
