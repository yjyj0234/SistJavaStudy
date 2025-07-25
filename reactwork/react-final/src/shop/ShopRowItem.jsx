import axios from 'axios';
import React, { useState } from 'react'
import { useNavigate } from 'react-router-dom';

const ShopRowItem = ({idx,row}) => {
    const navi=useNavigate();
    let photoUrl="http://localhost:8090/save/";
     //상세보기
/*   const detail=()=>{
    let url="http://localhost:8090/shop/detail";
    axios.get(url)
    .then(res=>{
      setShopData(res.data);
      console.log("상세보기:"+res.data);
    })
  } */
  return (
    <tr>
        <td>{idx+1}</td>
        <td>
            <img src={photoUrl+row.photo} alt="" style={{width:'200px', height:'200px'}}/>
            <b>{row.sangpum}</b>
            
            
        </td>
        <td>
            <button type='button' className='btn btn-outline-primary' onClick={()=>navi('/shop/detail/'+row.num)}>상세보기</button>
        </td>
    </tr>
  )
}

export default ShopRowItem
