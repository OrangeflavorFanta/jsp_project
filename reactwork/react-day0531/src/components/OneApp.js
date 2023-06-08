import React, { useState } from 'react';
import '../App.css';

function OneApp(props) {

    const [number,setNumber]=useState(0);

    const numberIncre=() =>{
        if(number===10){
            alert("10까지만 증가 가능합니다.");
            return;
        }
        setNumber(number+1);

    }

    const numbeDecre=() =>{
        if(number===0){
            alert("0까지만 감소 가능합니다.");
            return;
        }
        setNumber(number-1);
    }

    return (
        <div>
            <h2 className='alert alert-info'>OneApp입니다.</h2>
            <div className='number'>{number}</div>

            <button type='button' style={{marginLeft:'70px'}}
            onClick={numberIncre}>증가</button>
            <button type='button' style={{marginLeft:'70px'}}
            onClick={numbeDecre}>감소</button>
        </div>
    );
}

export default OneApp;