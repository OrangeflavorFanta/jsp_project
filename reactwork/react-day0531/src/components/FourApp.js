import React from 'react';
import Alert from '@mui/material/Alert';
import BusAlertIcon from '@mui/icons-material/BusAlert';


function FourApp(props) {

    //배열 변수 선언
    const names = ['이우형', '김영돈', '이지영', '이지민', '박예은']

    //반복문을 변수에 저장후 출력해도 됨... 리턴해서 직접주는 경우가 더 많다
    const nameList = names.map((name) => (<li>{name}</li>))
    // name을 list로 받을거야 map을 li로 리턴 받을거야
    //한 줄은 자동 리턴(li) 태그가 리턴


    //색상을 배열로
    const colors=['red','blue','pink','orange','green']


    return (
        <div>
            
                <Alert severity="error" style={{ fontSize: '20px' }}>
                    FourApp입니다.&nbsp; <BusAlertIcon /></Alert>
                

            <div>
                <h3>map 반복문 연습</h3>
                <ol>{nameList}</ol>

                <hr />
                <ul>
                    {
                        //반복문 리턴에 직접주어도 된다
                        names.map((name, index) => (<b style={{ marginLeft: '10px' }}><br/>{index} : {name}</b>))
                    }

                </ul>

            </div>

            <div>
                <hr />
                <ul>
                    {
                        //반복문 리턴에 직접주어도 된다
                       colors.map((color) => (<div className='box' style={{backgroundColor:color}}></div>))
                    }

                </ul>

            </div>


        </div>
    );
}

export default FourApp;