import React from 'react';
import { BrowserRouter } from 'react-router-dom';
import RouterMain from './RouterMain';

function Root(props) {
    return (
        <BrowserRouter>
            <RouterMain></RouterMain>
        </BrowserRouter>
    );
}

export default Root;