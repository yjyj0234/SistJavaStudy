import React from 'react'


const SixSubApp = (props) => {
  console.log(props);
  return (
    <div>
      SuxSubApp 의 첫번째 자식
      {/* 부모가 보낸 데이타를 props를 통해서 출력을 할수 있다 그러나 이름과 나이 변경은 할 수 없다
      (읽기만 가능) */}
      <div className='line'>{props.name}님의 나이는 {props.age}입니다</div>
    </div>
  )
}

export default SixSubApp

