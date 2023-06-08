import React from 'react';
import '../App.css';
import titleImg from '../image/jejuair.png';

function Title(props) {
    return (
        <div>
            <img src={titleImg} style={{height:'100px'}}/>
            <b style={{fontSize:'20px', color:'green'}}>React&SpringBootProject</b>
        </div>
    );
}

export default Title;