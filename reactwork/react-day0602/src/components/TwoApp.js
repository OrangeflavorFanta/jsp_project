import React, { useState } from 'react';

function TwoApp(props) {

    const [board,setBoard]=useState([
        {
            no:1,
            writer:'박예은',
            subject:'hello~~',
            photo:'1'
        },
        
        {
            no:2,
            writer:'이지민',
            subject:'바보~~',
            photo:'2'
        },

        {
            no:3,
            writer:'성한경',
            subject:'에붸부베ㅔㅜㅂㅂ~~',
            photo:'3'
        },
        
        {
            no:1,
            writer:'장환라',
            subject:'갈겨~~',
            photo:'a'
        }
        

    ]);


    return (
        <div>
            <h2>TwoApp_객체공통변수로 테이블_배열안에 객체 출력</h2>
            <table className='table table-bordered' style={{width:'50px'}}>
                <caption><b>배열객체출력</b></caption>
                <thead>
                    <tr style={{backgroundColor:'#ddd'}}>
                    <th width='60'>번호</th>
                    <th width='100'>이미지</th>
                    <th width='260'>제목</th>
                    <th width='120'>작성자</th>
                    </tr>
                </thead>
                <tbody>
                    {
                        board.map((row,index)=>(
                            <tr>
                                <td>{row.no}</td>
                                <td><img src={`../image2/${row.photo}.png`} /></td>
                                <td>{row.subject}</td>
                                <td>{row.writer}</td>
                            </tr>
                       ) )
                    }
                </tbody>
                

            </table>
        </div>
    );
}

export default TwoApp;