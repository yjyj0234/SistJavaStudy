import React, { useState } from 'react'
//
import img1 from "/Food/1.jpg";
import img2 from "/Food/2.jpg";
import img3 from "/Food/3.jpg";
import img4 from "/Food/4.jpg";


function TwoApp() {
    const [hp1,setHp1]=useState('');
    const [hp2,setHp2]=useState('');
    const [hp3,setHp3]=useState('');

    const [img,setImg]=useState(img1);
    
    const changeHp1=(e)=>{
        setHp1(e.target.value);
    }
    const changeImg=(e)=>{
        setImg(e.target.value);
    }
   
  return (
    <div>
      <h1 className='alert alert-danber'>TwoApp</h1>
      <br/><br/>
      <div className='input input-group'>
            <select className='form-control' style={{width:'100px'}}
            onChange={changeHp1}>
                <option>02</option>
                <option >010</option>
                <option >031</option>
                <option >017</option>
            </select>
            <b>-</b>
            <input type="text" className='form-control' maxLength='4'
            style={{width:'100px'}} onChange={(e)=>{
                setHp2(e.target.value);
            }}/>
            <b>-</b>
            <input type="text" className='form-control' maxLength='4'
            style={{width:'100px'}} onChange={(e)=>{
                setHp3(e.target.value);
            }}/>
      </div>
      <div className='input-img'>
      <b>이미지 선택:</b>
      <select onChange={changeImg}>
            <option value="1">이미지1</option>
            <option value="2">이미지2</option>
            <option value="3">이미지3</option>
            <option value="4">이미지4</option>
      </select>
      </div>
      <div className='output'>
           <h1> {hp1}-{hp2}-{hp3}</h1><br />
      </div>
      <div className='output_img'>
            {/* src의 이미지 출력해보기 */}
            <img src={img==1?img1:img==2?img2:img==3?img3:img4}/>
            
      </div>
    </div>
  )
}

export default TwoApp
