import React, { useState } from 'react'

function QuizApp() {
    const [name,setName]=useState('');
    const [score,setScore]=useState(0);
    const [grade,setGrade]=useState('점수 입력하세요');
    const [color,setColor]=useState('');
    const enterEvent=(e)=>{
        if(e.key==='Enter'){
           if(score>=90){
            setGrade('장학생');
           }else if(score>=80){
            setGrade('평균학생');
           }else{
            setGrade('재시험');
           }
        }
    }

  return (
    
    <div>
      <h2>Quiz_APP 이름과 점수를 입력 후 엔터를 누르면 결과가 나오게 해주세요</h2>
        <div className='input'>
            <span>이름</span>
            <input type="text" className='form-control' 
            onChange={(e)=>{
                setName(e.target.value)
            }}
            />
            <span>점수</span>
            <input type="number" className='form-control'
            onChange={(e)=>{
                setScore(e.target.value)
            }}
            onKeyUp={enterEvent}
            />
        </div>
{/* 등급은 90점 이상:장학생 80점 이상:평균학생 나머지:재시험 */}
        <div className='output' style={{color:color}}>
            이름 : {name}  <br />
            점수 : {score}점   <br />
            등급 : {grade} <br />
        </div>
        {/* 라디오버튼 5개 만들고 black,red 등등 defaultValue값을 준 후
        버튼을 누르면 그 해당색으로 변경되게하세요 */}
        <div onClick={(e)=>
            setColor(e.target.value)
        }>
        <input type="radio" name='color' value='black' 
        defaultChecked/>검정 &nbsp;
        <input type="radio" name='color' value='red' defaultValue='red'
       />빨강 &nbsp;
        <input type="radio" name='color' value='green' 
       />초록 &nbsp;
        <input type="radio" name='color' value='blue' defaultValue={'blue'}
       />파랑 &nbsp;
        <input type="radio" name='color' value='yellow' defaultValue={'yellow'}
       />노랑 &nbsp;
        <input type="radio" name='color' value='coral' defaultValue={'coral'}
       />코랄 &nbsp;
        </div>
    </div>
  )
}

export default QuizApp
