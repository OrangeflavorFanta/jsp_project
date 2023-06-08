import React from 'react';
import mainImg1 from "../image/1.png";
import mainImg2 from "../image/2.png";
import mainImg3 from "../image/3.png";

function Main(props) {
    return (
        <div>
            <img src={mainImg1} className='main'/><br/>
            <img src={mainImg2} className='main'/><br/>
            <img src={mainImg3} className='main'/><br/>
        </div>
    );
}

export default Main;