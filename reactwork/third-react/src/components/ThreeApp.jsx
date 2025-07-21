import React, { useState } from 'react'

function ThreeApp() {
    const [photo,setPhoto]=useState('../image2/eventimg4.jpg');

  return (
    <div>
      <h1 className='alert alert-danger'>ThreeApp</h1>
      <div onClick={(e)=>{
        setPhoto(e.target.value);
      }}>
        <b>이모티콘 선택: </b>
        
        <label ><input type="radio" name='photo' value='../image2/eventimg4.jpg'
        defaultChecked/>이미지1</label>&nbsp;&nbsp;&nbsp;
        <label ><input type="radio" name='photo' value='../image2/eventimg5.png'/>이미지2</label>&nbsp;&nbsp;
        <label ><input type="radio" name='photo' value='../image2/eventimg3.jpg'/>이미지3</label>&nbsp;&nbsp;
        <label ><input type="radio" name='photo' value='../image2/eventimg2.jpg'/>이미지4</label>&nbsp;&nbsp;
        
      </div>

      <div className='output'>
            <img src={photo} alt="" style={{width:'400px'}}/>
      </div>
    </div>
  )
}

export default ThreeApp
