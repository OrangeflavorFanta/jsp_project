import React, { useState } from 'react';

function FourSubApp3(props) {
    return (
        <div>
            <button type='buttton' className='btn btn-info'
            style={{marginLeft:'50px'}}
            onClick={()=>{
                props.incre();
            }}>증가</button>
            
            <button type='buttton' className='btn btn-info'
            style={{marginLeft:'50px'}}
            onClick={()=>{
                props.decre();
            }}>감소</button>

        </div>
    );
}

export default FourSubApp3;