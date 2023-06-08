import React from 'react';
import Title from './Components/Title';
import Info from './Components/Info';
import Menu from './Components/Menu';
import { Route, Routes } from 'react-router-dom';
import Main from './Components/Main';
import Shop from './shop/Shop';
import Board from './board/Board';
import Login from './login/Login';
import Member from './member/Member';
import About from './Components/About';
import { ShopDetail, ShopForm } from './shop/Index';

function RouterMain(props) {
    return (
        <div>
            <div>
                <div className='title'><Title/></div>
                <div className='info'><Info/></div>
                <div className='menu'><Menu/></div>
                <div className='main'>
                    {/* 실질적으로 메인에 나오는 것이 들어감 */}
                    <Routes>
                        <Route path='/' element={<Main/>}/>

                        {/* shop을 자세히 나눌 예정 */}
                        <Route path='/shop/list' element={<Shop/>}/>
                        <Route path='/shop/form' element={<ShopForm/>}/>
                        <Route path='/shop/detail/:num' element={<ShopDetail/>} />

                        <Route path='/board/list' element={<Board/>}/>
                        <Route path='/login' element={<Login/>}/>
                        <Route path='/member/form' element={<Member/>}/>
                        <Route path='/about' element={<About/>}/>

                        <Route path='*' element={
                            <div>
                            <h1>잘못된 주소입니다.</h1>
                            </div>
                        }/>
                    </Routes>
                </div>
            </div>
        </div>
    );
}

export default RouterMain;