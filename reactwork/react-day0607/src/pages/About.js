import React from 'react';
import { useParams } from 'react-router-dom';//dom에 있는 useParams를 받게 됨

function About(props) {

    const {name}=useParams(); //RouterMain :name


    return (
        <div>
           <h1>안녕하세요 제 이름은 {name==null?'쌍용교육센터':name}입니다.</h1>
        </div>
    );
}

export default About;