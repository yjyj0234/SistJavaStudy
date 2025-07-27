import axios from 'axios';
import React, { useEffect, useState } from 'react'
import { useParams } from 'react-router-dom';

const ShopDetail = () => {
  const {num}=useParams();
  console.log(num);
  let photoUrl="http://localhost:8090/save/";
  const [ShopDetail,setShopDetail]=useState('');

  const [photo,setPhoto]=useState('');
    
  useEffect(()=>{
    
    axios.get(`http://localhost:8090/shop/detail/${num}`)
    .then(res=>{
      
      console.log(res.data);
      setShopDetail(res.data);
      setPhoto(res.data.photo);
  })
  
  },[num]);
  return (
    <div>
       <table className='table table-bordered' style={{width:'600px'}}>
        <caption style={{captionSide:'top'}}><b>상품 정보</b></caption>
        <tbody>
            <tr >
                <th width='100' className='table-secondary'>상품명</th>
                <td>
                   {ShopDetail.sangpum}
                </td>
                
            </tr>
              <tr>
                <th width='150' className='table-secondary'>상품이미지</th>
                <td>
                  <img src={photoUrl+photo} style={{width:'300px'}}/>
                </td>
              
            </tr>
              <tr>
                <th width='150' className='table-secondary'>수량</th>
                <td>
                    {ShopDetail.su}
                </td>
                
            </tr>
              <tr>
                <th width='150' className='table-secondary'>단가</th>
                <td>
                  {ShopDetail.dan}
                </td>
                
            </tr>
            <tr>
               
                <td colSpan={2}>
                    <button type='button' className='btn btn-success'
                    style={{width:'120px'}} 
                    >상품 수정</button>
                </td>
            </tr>
        </tbody>
      </table>
    </div>
  )
}

export default ShopDetail
