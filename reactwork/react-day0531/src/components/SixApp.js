import React, { useState } from 'react';
import Alert from '@mui/material/Alert';
import { NearMeSharp } from '@mui/icons-material';


function SixApp(props) {

    const [names,setNames] = useState(['서동익','박예은','이지민','유재석','이효리','유고걸'])

    //추가 할 이름
    const [irum,setIrum] = useState('');

    //추가버튼 이벤트
    const btnInsert=()=>{//concat: 베열에 추가
        setNames(names.concat(irum));//베열에 irum데이터를 추가
        setIrum('');//인풋에 이름 지워지게 만듦
    }

    // 입력 change 이벤트
    const txtInput=(e)=>{
        setIrum(e.target.value);
    }

    //enter쳐도 추가되게


    //더블클릭하면 이름이 삭제되게
    const dataRemove=(index)=>{

        console.log("remove: "+index);
        //filter 내가 추가 한 값은 지우고 기존 값을 재호출
        setNames(names.filter((item,i)=>i!==index));
    
    }


    return (
        <div>
             <Alert severity="info" style={{fontSize:'25px'}}>SixApp입니다.</Alert>

            <input value={irum} onChange={txtInput} /> 
            
            <button onClick={btnInsert}>추가</button>

            <br/>

            <h5>더블클릭하면 삭제됩니다.</h5> 
            <ul>
                {
                    names.map((name,index)=>(<li onDoubleClick={()=>dataRemove(index)}>{name}</li>))
                }    
            </ul>           
        </div>
    );
}

export default SixApp;