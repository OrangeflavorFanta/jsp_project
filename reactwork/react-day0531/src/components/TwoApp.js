import React, { useState } from 'react';

//이미지 5개
import img1 from '../image/01.png';
import img2 from '../image/02.png';
import img3 from '../image/03.png';
import img4 from '../image/04.png';
import img5 from '../image/05.png';

function TwoApp(props) {

    const [hp1,setHp1]=useState('02');
    const [hp2,setHp2]=useState('1234');
    const [hp3,setHp3]=useState('5678');
    const [photo,setPhoto]=useState('1');

    const changeHp1=(e)=>{
        setHp1(e.target.value);
    }

    const changeHp2=(e)=>{
        setHp2(e.target.value);
    }

    const changeHp3=(e)=>{
        setHp3(e.target.value);
    }

    const changePhoto=(e)=>{
        setPhoto(Number(e.target.value));
    }




    return (
        <div>
            <h2 className='alert alert-info'>TwoApp입니다.</h2>

            <div className='form-inline'>{/* form-inline: 같은 줄로 가는 것 */}
                <select className='form-control' style={{width:'70px'}}>
                    <option>02</option>
                    <option>010</option>
                    <option>017</option>
                    <option>019</option>

                </select>

                <b>-</b>
                <input type='text' maxLength={4} className='from-control' style={{width: '100px'}}
                defaultValue={hp2} onKeyUp={changeHp2}/>
                <b>-</b>
                <input type='text' maxLength={4} className='from-control' style={{width: '100px'}}
                 defaultValue={hp3} onKeyUp={changeHp3}/>

                <b style={{marginLeft:'100px'}}>이미지 선택: </b>
                <select className='form-control' onChange={changePhoto}>
                    <option value="1">한경</option>
                    <option value="2">환라</option>
                    <option value="3">지민</option>
                    <option value="4">예은</option>
                    <option value="5">보현</option>
                    <option value="6">재승</option>
                </select>
            </div>

            <br/><br/>
            <h1>{hp1}-{hp2}-{hp3}</h1>
            <img src={photo===1?img1:photo===2?img2:photo===3?img3:photo===4?img4:img5} className='photo' />

        </div>
    );
}

export default TwoApp;