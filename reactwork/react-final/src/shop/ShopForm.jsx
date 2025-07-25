import axios from 'axios';
import React, { useState } from 'react'
import { useNavigate } from 'react-router-dom';

const ShopForm = () => {
    const [photo, setPhoto] =useState('');
    const [sangpum,setSangpum] = useState('');
    const [su,setSu]= useState('');
    const [dan, setDan] = useState('');

    const navi=useNavigate();//인서트 후 목록


    //url등록 백엔드 주소
    let uploadUrl="http://localhost:8090/shop/upload";
    //저장된 사진에 대한 url
    let photoUrl="http://localhost:8090/save/";
    //insert url
    let insertUrl="http://localhost:8090/shop/insert";


    //file change에 대한 호출 이벤트(미리보기)
    const uploadImage=(e)=>{
        const uploadFile=e.target.files[0];
        const imageFile=new FormData();     //axios의 data에 넘어감
               //'uploadFile' : 백엔드 멀티파트 부분의 uploadFile
        imageFile.append('uploadFile',uploadFile)

        //axios (ajax 처럼)
        axios({
            method:'post',
            url:uploadUrl,
            data:imageFile,
            headers:{
                'Content-Type':'Multipart/form-data'
            }
            
        }).then(res=>{
            console.log("백엔드 응답값:", res.data);
            setPhoto(res.data); //res.data는 백엔드에서 넘어온 이미지 파일명
        }).catch(err=>{
            console.error("업로드 에러:", err);
            alert(err);
        })
    }
     //insert
        const onInsert=()=>{
            axios.post(insertUrl,{sangpum, su, dan})    //{"sangpum":sangpum} 같을땐 생략(key값이 스프링 이름과 일치)
            .then(res=>{
                //insert 성공후 처리할 코드
                navi("/shop/list");
            })
        }
  return (
    <div>
      <table className='table table-bordered' style={{width:'600px'}}>
        <caption style={{captionSide:'top'}}><b>상품 등록</b></caption>
        <tbody>
            <tr >
                <th width='100' className='table-secondary'>상품명</th>
                <td>
                    <input type="text" className='form-control'
                    style={{width:'200px'}} onChange={(e)=>{
                        setSangpum(e.target.value)
                    }}/>
                </td>
                <th></th>
            </tr>
              <tr>
                <th width='150' className='table-secondary'>상품이미지</th>
                <td>
                    <input type="file" className='form-control'
                    style={{width:'300px'}} onChange={uploadImage}/>
                </td>
                <th></th>
            </tr>
              <tr>
                <th width='150' className='table-secondary'>수량</th>
                <td>
                    <input type="text" className='form-control'
                    style={{width:'200px'}} onChange={(e)=>{
                        setSu(e.target.value);
                    }}/>
                </td>
                <th></th>
            </tr>
              <tr>
                <th width='150' className='table-secondary'>단가</th>
                <td>
                    <input type="text" className='form-control'
                    style={{width:'200px'}} onChange={(e)=>{
                        setDan(e.target.value);
                    }}/>
                </td>
                <th></th>
            </tr>
            <tr>
                <td colSpan='2'>
                    <img src={photoUrl+photo} alt="" style={{width:'120px'}}/>
                </td>
                <td>
                    <button type='button' className='btn btn-success'
                    style={{width:'120px',height:'120px'}} 
                    onClick={onInsert}>상품 등록</button>
                </td>
            </tr>
        </tbody>
      </table>
    </div>
  )
}

export default ShopForm
