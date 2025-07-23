import React from 'react'

const EightSubApp1 = (props) => {
    const p=props;
    const arrImg=Array.from({length:5},(element,i)=>String(i+21));
    

  return (
    <div>
      <h3>EightSubApp1_자식1 컴포넌트</h3>
      <b>메세지</b>
      <input type="text" className='form-control' onChange={p.onChange} name="message"/>
      <b>글자색 변경</b>
      <input type="color" className='form-control' defaultValue='#ffccff' name="color" onChange={p.onChange}/>
      <b>이미지 변경</b>
      <select className='form-control' name='photo' onChange={p.onChange}>
        {/* option은 1~10번까지만 배열로 생성할것 */}
            {
                arrImg.map((num)=>(
                    <option key={num} value={num}>{num}</option>
                ))
            }
            
        

      </select>
    </div>
  )
}

export default EightSubApp1
