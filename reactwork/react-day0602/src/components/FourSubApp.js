import React from 'react';

function FourSubApp(props) {

    console.dir(props);

    return (
        <div>
            <div>{props.name}님의 나이는 {props.age}입니다.</div>
        </div>
    );
}

export default FourSubApp;