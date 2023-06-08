import React, { useState } from 'react';

function FourthApp (props){

    const [name, setName]=useState('성한경');
    const [age, setAge]=useState(22);

    return (
        <div>
            <h2 className='alert alert-info'>FourthApp입니다.</h2>

            <b style={{fontSize:'30px'}}>
                이름: {name} 
                <span style={{marginLeft:'50px'}}></span>
                나이: {age}
                <span style={{marginLeft:'50px'}}></span>

            </b>
            <br/><br/>

            <button type='button' className='btn btn-info'
            style={{marginLeft:'50px'}}
            onClick={()=>{
                setName("장환라");
                setAge(26);
            }}>본인 이름으로 변경</button>

            <button  type='button' className='btn btn-info'
            style={{marginLeft:'50px'}}>뭔소리여</button>

            <button  type='button' className='btn btn-info'
            style={{marginLeft:'50px'}}>초기화</button>

        </div>
    );
};

export default FourthApp;