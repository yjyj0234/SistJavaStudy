import React from 'react'
import winter from '../SemiImg/eventimg4.jpg'
function SecondApp() {
    const imgStyle2={
        border:'5px dotted pink',
        borderRadius:'30px',
        width:'300px'
    }
    let hello_Message=<h3>안녕 오늘은 리액트 할겁니다</h3>;
  return (
    <div>
      <h2 className='alert alert-primary'>SecondApp입니다</h2>
      {/* src이미지 가져와서  imgstyle2 적용해보기 */}
        <img src={winter} style={imgStyle2}/>
      {hello_Message}
      {hello_Message}
    </div>
    
  )

}

export default SecondApp
