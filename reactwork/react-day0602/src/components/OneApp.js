import React, { useEffect, useState } from 'react';

function OneApp(props) {


    const [name,setName]=useState('홍길동');
    const [addr,setAddr]=useState('서울시');

    //1
    useEffect(()=>{
        console.log("state변수가 값변동될 때 마다 호출");//변경시마다 list가 호출되고자 할 때
    })

    //2
    useEffect(()=>{
        console.log("처음 랜더린 시 한번만 호출");//생성자처럼 사용하고자 할 때
    },[]);//딱 한번만 호출

    //3
    useEffect(()=>{
        console.log("이름 변경시에만 호출");
    },[name]);

    return (
        <div>
           <h2 className='alert alert-info'>OneApp_UseEffect</h2>
          
           <h3>이름: <input type='text' defaultValue={name}
           onChange={(e)=>{
            setName(e.target.value);
           }}/></h3>
           <h3>주소: <input type='text' defaultValue={addr}
           onChange={(e)=>{
            setAddr(e.target.value);
           }} /></h3>
           
           <hr/>

           <h2>이름: {name}</h2>
           <h2>주소: {addr}</h2>
        </div>
    );
}

export default OneApp;