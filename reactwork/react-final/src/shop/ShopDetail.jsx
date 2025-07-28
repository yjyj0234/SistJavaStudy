import axios from 'axios';
import React, { useEffect, useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom';
import Button from '@mui/material/Button';
import TextField from '@mui/material/TextField';
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogContentText from '@mui/material/DialogContentText';
import DialogTitle from '@mui/material/DialogTitle';

const ShopDetail = () => {
  const {num}=useParams();
  console.log(num);
  let photoUrl="http://localhost:8090/save/";
  const detailUrl=`http://localhost:8090/shop/detail?num=${num}`;
  const deleteUrl=`http://localhost:8090/shop/delete?num=${num}`;

  const [ShopDetail,setShopDetail]=useState('');
  const navi=useNavigate();

  const onDataReceive=()=>{
    axios.get(detailUrl)
    .then(res=>{
      console.log(res.data.sangpum);
      setShopDetail(res.data);
    }).catch(err=>{
      alert(err.data);
    })
  }
   useEffect(()=>{
      onDataReceive();
    },[]);
  /* useEffect(()=>{
    
    axios.get(`http://localhost:8090/shop/detail/${num}`)
    .then(res=>{
      
      console.log(res.data);
      setShopDetail(res.data);
      setPhoto(res.data.photo);
  })
  
  },[num]); */
  const [open, setOpen] = React.useState(false);

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };
  
  //삭제시 호출할 함수
   const onDelete=()=>{
    console.log("delete");
    //delete 할때는 axios.delete
    axios.delete(deleteUrl)
    .then(()=>{
      console.log("삭제 성공");
      navi("/shop/list");
    })
    handleClose();
   }
  

   

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
                  <img src={photoUrl+ShopDetail.photo} style={{width:'300px'}}/>
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
              <th>입고일</th>
              <td>
                {ShopDetail.ipgoday}
              </td>

            </tr>
            <tr>
               
                <td colSpan={2}>
                    <button type='button' className='btn btn-success'
                    style={{width:'120px'}} 
                    >상품 수정</button>
                    <button type='button' className='btn btn-outline-secondary'
                    onClick={()=>{
                      navi('/shop/list');
                    }}>목록</button>
                    <button type='button' className='btn btn-outline-secondary'
                    onClick={handleClickOpen}>삭제</button>

                </td>
            </tr>
        </tbody>
      </table>
        
       {/* ...existing code... */}
       
       {/* Dialog 추가 */}
       <Dialog
        open={open}
        onClose={handleClose}
        aria-labelledby="alert-dialog-title"
        aria-describedby="alert-dialog-description"
      >
        <DialogTitle id="alert-dialog-title">
          {"상품 삭제"}
        </DialogTitle>
        <DialogContent>
          <DialogContentText id="alert-dialog-description">
            정말로 이 상품을 삭제하시겠습니까?
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button onClick={handleClose}>취소</Button>
          <Button onClick={onDelete} autoFocus>
            삭제
          </Button>
        </DialogActions>
      </Dialog>
    
    </div>
  )
}

export default ShopDetail
