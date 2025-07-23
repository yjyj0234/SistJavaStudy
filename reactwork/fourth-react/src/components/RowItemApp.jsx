import React from 'react'

const RowItemApp = (props) => {
  let {row,idx,onDelete}=props;
  const handleDeleteClick=()=>{
    onDelete(idx);
  }
  return (
    <tr>
        <td>{row.name}</td>
        <td><img src={`/image/연예인사진/${row.photo}.jpg`} alt="" style={{width:'50px'}}/></td>
        <td>{row.mbti}</td>
        <td>{row.today.toLocaleDateString('ko-kr')}</td>
        <td>
          <button type='button' className='btn btn-danger btn-sm'
          onClick={handleDeleteClick}>삭제</button>
        </td>
    </tr>
  )
}

export default RowItemApp
