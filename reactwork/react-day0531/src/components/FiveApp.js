import React from 'react';
import Alert from '@mui/material/Alert';

//이미지 5개
import img1 from '../image/01.png';
import img2 from '../image/02.png';
import img3 from '../image/03.png';
import img4 from '../image/04.png';
import img5 from '../image/05.png';

function FiveApp(props) {

    //이미지를 배열 변수에 넣기
    const imgArr=[img1,img2,img3,img4,img5];

    //public이미지
    const imgArr2=['1','2','3','a01','a02','a03'];

    return (
        <div>
            
             <Alert severity="warning" style={{fontSize:'25px'}}>FiveApp입니다.</Alert>

             <h4>src의 이미지를 배열로 널어 반복하기</h4>
            <ul>
                {
                    imgArr.map((myImg)=>(<img src={myImg} style={{width:'100px'}}/>))
                    
                }

            </ul>

            <hr/>

            <h4>public의 이미지를 배열로 넣어 반복하기</h4>
            {
                imgArr2.map((photo)=>(<img src={`../../image2/${photo}.png`} className='photo'/>))
            }


        </div>
    );
}

export default FiveApp;