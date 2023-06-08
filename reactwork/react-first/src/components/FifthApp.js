import React, { useState } from 'react';

function FifthApp (props) {

    //변수
    const [name, setName]=useState('');
    const [java, setJava]=useState(0);
    const [spring, setSpring]=useState(0);
    const [total, setTotal]=useState(0);
    const [avg, setAvg]=useState(0);
    return (
        <div>
            <h2 className='alert alert-info'>FifthApp입니다.</h2>
            <div className='inp'>
                이름: <input type='text' style={{width:'100px'}} 
                    onChange={(e)=>{
                        setName(e.target.value);
                        }}/>
                <span style={{marginLeft:'10px',color:'magenta'}}>{name}</span>
                <br/>

                자바점수:<input type='text' style={{width:'100px'}}
                    onChange={(e)=>{
                        setJava(e.target.value);
                        }}/>
                <span style={{marginLeft:'10px',color:'magenta'}}>{java}</span>
                <br/>

                스프링점수:<input type='text' style={{width:'100px'}}
                    onChange={(e)=>{
                        setSpring(e.target.value);
                        }}/>
                <span style={{marginLeft:'10px',color:'magenta'}}>{spring}</span>
                <br/>
                <br/>

                <button type='button' className='btn btn-info'
                    onClick={()=>{
                        setTotal(Number(java)+Number(spring));
                        //setAvg((Number(java)+Number(spring)/2));
                        setAvg((Number(total/2)));
                    }}>결과확인</button>

            </div>
                  
            <div className='result'>
                이름: {name}<br/>
                자바점수: {java}<br/>
                스프링점수: {spring}<br/>
                총점: {total}점<br/>
                평균: {avg}점<br/>

            </div>
            
        </div>
    );
};

export default FifthApp;