import React, { useState } from 'react';

function Writeform({onSave}) {

    const [writer, setWriter] = useState('');
    const [photo, setPhoto] = useState('1');
    const [subject, setSubject] = useState('밥먹자');


    //추가라는 버튼 이벤트 만들기
    const addDataEvent = () => {

        //부모 컴포턴트에 있는 onSave이벤트 호출
        onSave({ writer, photo, subject });
    }

    return (
        <div>
            <b>이름: </b>
            <input type='text' style={{ width: '100px' }}
                onChange={(e) => {
                    setWriter(e.target.value);
                }}></input>

            <b>제목: </b>
            <input type='text' style={{ width: '100px' }}
                onChange={(e) => {
                    setSubject(e.target.value);
                }}></input>

            <b>이미지: </b>
            <select onChange={(e) => {
                setPhoto(e.target.value);
            }}>
                {
                    //1~5까지를 map으로 돌리기 a01...a05
                    [...new Array(5)].map((a0, idx) => (<option>{`a0${idx + 1}`}</option>))//펼침 연산자로 배열 안에 값을 불러와 주겠다
                }

            </select>

            <button type='button' className='btn btn-info btn-sm'
                style={{ marginLeft: '20px' }} onClick={addDataEvent}>추가</button>


        </div>
    );
}

export default Writeform;