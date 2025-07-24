import React from 'react'
import { useParams } from 'react-router-dom'

const About = () => {
  const {name} =useParams(); //RouterMain의 :name 을 의미
  console.log({name});
  console.log({name}.name)
  return (
    <div>
      <h5 className='main_about'>
          안녕하세요 제이름은 {name==null?"쌍용교육센터":name}입니다
      </h5>
    </div>
  )
}

export default About
