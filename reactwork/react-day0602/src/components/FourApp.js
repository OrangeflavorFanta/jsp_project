import React, { useState } from 'react';
import FourSubApp from './FourSubApp';
import FourSubApp2 from './FourSubApp2';
import FourSubApp3 from './FourSubApp3';

function FourApp(props) {

    const[number,setNumber]=useState(10);
    
    //증가
    const numberIncre=()=>{
        setNumber(number+1);
    }

    //감소
    const numberDecre=()=>{
        setNumber(number-1);
    }

    return (
        <div>
            <h4 className='alert alert-info'>FourApp_부모가 자식에세 전달할 때 (props)
            이건 자식 입장에서는 읽기전용(출력은 가능, 변경은 불가능)
            만약 자식 컴포넌트에서 부모에게 전달하고자 할 때 
            이벤트통해해서 부모데이터 변경가능(props는 이벤트도 전달가능)</h4>

           <FourSubApp name="종수" age="26"/>{/* //연속으로 호출 가능 */}
           <FourSubApp name="예은" age="25"/>
           <FourSubApp name="한경" age="24"/>
           {/* props변수로 name,age전달 */}

           <br/><br/>

           <FourSubApp2 food="육쌈냉면" price="11000"/>
           <FourSubApp2 food="마라샹궈" price="15000"/>
           <FourSubApp2 food="삼겹살" price="9800"/>

           <br/><br/>
           <h1 style={{color:'red'}}>{number}</h1>

           <FourSubApp3 incre={numberIncre} decre={numberDecre} />

            

        </div>
    );
}

export default FourApp;