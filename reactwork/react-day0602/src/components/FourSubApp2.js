import React from 'react';

// function FourSubApp2(props) {

//     console.dir(props);

//     return (
//         <div>
//             <div>{props.food}의 가격은 {props.price}원입니다.</div>
//         </div>
//     );
// }

function FourSubApp2({food,price}) {

    return (
        <div>
            <div>{food}의 가격은 {price}원입니다.</div>
        </div>
    );
}

export default FourSubApp2;