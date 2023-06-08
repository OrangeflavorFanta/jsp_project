import React from 'react';

function RowItem({row,idx,onDelete}) {

    console.dir();

    //삭제 이벤트
    const btnDelete=()=>{
        onDelete(idx);//부모가 props로 보낸 이벤트 호출
    }



    return (
        <tr>
            <td>{row.writer}</td>
            <td><img src={`../image2/${row.photo}.png`} style={{width:'100px', height:'100px'}} /></td>
            <td>{row.subject}</td>
            <td>{row.today.toLocaleDateString('ko-kr')}</td>
            {/* 날짜형식 타입 오류나므로 스트링 타입으로 바꿔서 해줘야 함 */}
            <td><button type='button' className='btn btn-danger btn-xs'
            onClick={btnDelete}>삭제</button></td>
        </tr>
    );
}

export default RowItem;