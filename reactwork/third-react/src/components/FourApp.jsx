import React from 'react'
import img1 from '/Food/10.jpg'
import img2 from '/Food/5.jpg'
import img3 from '/Food/6.jpg'
import img4 from '/Food/8.jpg'
import img5 from '/Food/12.jpg'

function FourApp() {
//배열변수 선언
const names=['카리나','윈터','강호동','네이마르','조던'];
const nameList=names.map((name)=>(<li>{name}</li>))
const colors=['darkred','cornflowerblue','darkgreen','lightgray','tomato'];
const colorList=colors.map((color)=>(<div className='box' style={{backgroundColor:color}}></div>))

//이미지를 배열변수에 넣기
const imgArr=[img1,img2,img3,img4,img5];

//이미지 배열변수_public
const imgPArr=['3','4','5','2','8','12'];


/* 직접 주는거면 ' ' 붙이고 변수면 ' ' 필요 없음 */
  return (
    <div>
      <h1 className='alert alert-danger'>반복문 연습</h1>
      <ol>{nameList}</ol>
      <hr />
      <ul>
        {
          /* 반복문을 리턴에 직접주어도 된다 */
          names.map((name,index)=>(<b style={{marginLeft:'10px'}}>{index+1}:{name}</b>))
        }
      </ul>
      <hr />

        {/* colors를 div로 출력할것(box) */}
        {colorList}
        <hr style={{clear:'both'}}/>

        {/* src의 이미지를 배열반복출력 너비 100*/}
        {imgArr.map((photo)=>(<img src={photo} style={{width:'100px'}}/>))}

          <hr />
          {/* public 의 이미지 배열 반복 출력 css*/}
          {
            imgPArr.map((pimg)=>(<img src={'/Food/'+pimg+'.jpg'} className='myphoto'/>))
          }
          <hr />
          {
            imgPArr.map((photo)=>(<img src={`../Food/${photo}.jpg`} className='myphoto'/>))
          }
    </div>
  )
}

export default FourApp
