import React, { useState } from 'react';
import RowItem from './RowItem';
import Writeform from './Writeform';

function FiveApp(props) {

    const [board,setBoard]=useState([
        {
            no:1,
            writer:'박예은',
            subject:'hello~~',
            photo:'1',
            today: new Date()
        },
        
        {
            no:2,
            writer:'이지민',
            subject:'바보~~',
            photo:'2',
            today: new Date()
        },

        {
            no:3,
            writer:'성한경',
            subject:'에붸부베ㅔㅜㅂㅂ~~',
            photo:'3',
            today: new Date()
        },
        
        {
            no:4,
            writer:'장환라',
            subject:'갈겨~~',
            photo:'a',
            today: new Date()
        }
        

    ]);


    //데이터 추가하는 함수이벤트
    // board를 바꾸면 렌더링이 다시되면서 추가

    const dataSave=(data)=>{

        setBoard(board.concat({
            // writer:data.writer,
            // photo:data.photo,
            // subject:data.subject, 이렇게 해도 되고!!
            //펼침연산자로 할거면 이렇게
            ...data,
            today:new Date()
        }));

    }

    //데이터 삭제
    const dataDelete=(idx)=>{

        setBoard(board.filter((item,i)=>(i!==idx)));///i와 뭐시기 빼고 재배치
        
    }



    return (
        <div>
            <h2>FiveApp_부모테이블</h2>

            <Writeform onSave={dataSave} />



            <table className='table table-bordered' style={{width:'600px'}}>
                <thead>
                    <tr style={{backgroundColor:'#ddd'}}>
                        <th width='100'>이름</th>
                        <th width='100'>사진</th>
                        <th width='250'>제목</th>
                        <th width='150'>날짜</th>
                        <th width='100'>삭제</th>
                    </tr>
                </thead>
                <tbody>
                    {
                        //데이터 개수만큼 호출... 출력은 안됨.. 자식RowItem에서 출력
                        board.map((row,index)=>(<RowItem row={row} idx={index}
                        onDelete={dataDelete} />))
                    }
                </tbody>

            </table>
        </div>
    );
}

export default FiveApp;