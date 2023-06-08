import React, { useState } from 'react';
import '../App.css';


function ThreeApp(props) {

    const [photo,setPhoto]=useState('../../image2/1.png');

    const changePhoto=(e)=>{
        setPhoto(e.target.value);
    }

    return (
        <div>
             <h2 className='alert alert-info'>ThreeApp입니다.</h2>

            <div style={{fontSize:'20px'}}>
                <label>
                   
                    <input type='radio' value='../../image2/1.png' defaultChecked 
                    onClick={changePhoto}/>이미지1  {/* 퍼블릭에 둔건 변수 안주고 직접 가져올 수 있음 */}
                </label>
                &nbsp;&nbsp;

                <label>
                   
                   <input type='radio' value='../../image2/2.png' 
                   onClick={changePhoto} />이미지2
               </label>
               &nbsp;&nbsp;

               <label>
                   
                   <input type='radio' value='../../image2/3.png' 
                   onClick={changePhoto} />이미지3
               </label>
               &nbsp;&nbsp;
               
               <label>
                   
                   <input type='radio' value='../../image2/a.png' 
                   onClick={changePhoto} />이미지4
               </label>
               &nbsp;&nbsp;
               
               <label>
                   
                   <input type='radio' value='../../image2/a01.png' 
                   onClick={changePhoto} />이미지5
               </label>
               &nbsp;&nbsp;
            </div>

            <img src={photo} />

        </div>
    );
}

export default ThreeApp;