import React, { useState } from 'react'

const EightSubApp2 = (props) => {
  const p=props;
  const [scolor,setScolor]=useState('#ffffff');

  const handleColorChange=(e)=>{
    setScolor(e.target.value);
  }
  const saveColor=()=>{
    p.onClick(scolor);
  }
   

  return (
    <div>
      <h3>EightSubApp2_2번째 자식 컴포넌트</h3>
      <b>색상선택:</b>
      <input type="color" style={{width:'100px'}}  value={scolor} onChange={handleColorChange}/>

      <button type='button' className='btn btn-success' onClick={saveColor}>색상 추가</button>
    </div>
  )
}

export default EightSubApp2
