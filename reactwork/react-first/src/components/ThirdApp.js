import React, { useState } from 'react';

function ThirdApp(props) {

    //상태관리를 위한 변수설정
    const [message, setMessage]=useState('HappyDay!!!');

    //이벤트 함수
    const handleEnter=(e)=>{

        if(e.key=='Enter'){

            setMessage('');
            e.target.value='';
        }

    }

    return (
        <div>
            <h2 className='alert alert-danger'>ThirdApp입니다.</h2>
            <h3 style={{color:'red'}}>{message}</h3>

            <hr></hr>

            <h4>메세지를 입력해주세요</h4>
            <input type='text' style={{width:'300px',fontSize:'2em'}}
            defaultValue={message}
            onChange={(e)=>{
            //    console.log(e.target.value)//입력한 값
                //message변수에 입력값 넣기
                setMessage(e.target.value);
            }} onKeyUp={handleEnter}
            
            >

            



            </input>

        </div>
    );
};

export default ThirdApp;