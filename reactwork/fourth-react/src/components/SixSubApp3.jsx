import React from 'react'

function SixSubApp3({incre,decre}) {
  return (
    <div>SixSubApp3_SixApp의 3번째 자식
      <button type='button' className='btn btn-success' onClick={incre}>증가</button>
      <button type='button' className='btn btn-danger' onClick={decre}>감소</button>
    </div>
  )
}

export default SixSubApp3
