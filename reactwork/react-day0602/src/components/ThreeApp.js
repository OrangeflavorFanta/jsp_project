import React, { useRef, useState } from 'react';

function ThreeApp(props) {

    //일반 state변수 주기
    const [count,setCount]=useState(0);

    //ref선언하는 법
    const countRef=useRef(0);

    //state증가함수
    const stateIncre=()=>{
        setCount(count+1);//누를 때마다 계속 렌더링됨(화면ㅇ 계속 바뀜)
    }

    //ref증가함수
    const refIncre=()=>{
        countRef.current=countRef.current+1; //ref변수.current
        console.log("countRef: "+countRef.current);//렌더링이 안되므로 콘솔로 확인
    }

    return (
        <div>
           <h2>ThreeApp_useRef</h2>
           <button type='button' className='btn btn-info'
           onClick={stateIncre}>state변수 증가</button>
           <h1>{count}</h1>

           <h2>ThreeApp_useRef</h2>
           <button type='button' className='btn btn-info'
           onClick={refIncre}>ref변수 증가</button>
           <h1>{countRef.current}</h1>

        </div>
    );
}

export default ThreeApp;