import React, { useState } from 'react'
import Alert from '@mui/material/Alert';
import CheckIcon from '@mui/icons-material/Check';
import AnchorIcon from '@mui/icons-material/Anchor';
import img1 from '../assets/SemiImg/eventimg4.jpg';
import img2 from '../assets/SemiImg/kakao.png';
import img3 from '../assets/SemiImg/eventimg5.png'
import img4 from '../assets/SemiImg/eventimg2.jpg'

function ThreeApp() {
const [msg,setMsg] =useState('리액트복습좀 합시다');
const [photo,setPhoto]=useState(img1);
const [width,setWidth]=useState('200');
//점점 작게 이벤트, 점점 크게 이벤트
const [border,setBorder]=useState('solid');
const smallImage=()=>{
    setWidth(width-10);
}
const largeImg=()=>{
    setWidth(width+10);
}
  return (
    <div>
        <div>
            <input type="text" className='control' style={{width:'400px;'}}
            placeholder='메세지를 입력해주세요'
            onChange={(e)=>{
                setMsg(e.target.value);
            }}/>
        </div>
        <div>
            <select name="" id="" className='form-select' style={{width:'300px;'}} 
            onChange={(e)=>{
                setPhoto(e.target.value);
            }}>
            <option value={img1}>A</option>
            <option value={img2}>B</option>
            <option value={img3}>C</option>
            <option value={img4}>D</option>
            </select>
            <br></br>

            {/* border */}
            <select name="" id="" className='form-select' style={{width:'300px;'}} 
            onChange={(e)=>{
                setBorder(e.target.value);
            }}>
            <option value={'solid'} >solid</option>
            <option >dotted</option>
            <option >inset</option>
            <option >groove</option>
            </select>
            
            <br /><br />
            <button type='button' className='btn btn-info'
            style={{marginLeft:'10px'}} 
            onClick={smallImage}>점점 작게</button>
            <button type='button' className='btn btn-info'
            style={{marginLeft:'50px'}}
            onClick={largeImg}>점점 크게</button>
        </div>

      <h1>ThreeApp입니다</h1>
      <h2 className='alert alert-info'>{msg}</h2>

      <Alert icon={<AnchorIcon fontSize="inherit" />} severity="success">
        {msg}
       </Alert>
            {/* 이미지 */}
            <img src={photo} alt="" style={{width:`${width}px`,border:`10px ${border} cornflowerblue`}}/>
    </div>
  )
}

export default ThreeApp
