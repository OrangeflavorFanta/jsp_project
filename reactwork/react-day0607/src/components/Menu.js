import React from 'react';
import { NavLink } from 'react-router-dom';
import "../App.css";

function Menu(props) {
    return (
        <div>
            <ul className='menu'>
                {/* 라우터 돈 안다운 받으면 navlink안뜸 */}
            <li><NavLink to='/'>Home</NavLink></li>
            <li><NavLink to='/about'>About</NavLink></li>
            <li><NavLink to='/about/JHR'>About2</NavLink></li>
            </ul>
        </div>
    );
}

export default Menu;