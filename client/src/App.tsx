import React, { useEffect, useState } from 'react';


function App() {

    const [message, setMessage] = useState('');

    useEffect(() => {
        fetch('/api/hello').then(res => res.text()).then(res => setMessage(res));
    }, [])
    return (
        <div>
            <h2>Text from server</h2>
            {message}
            <img src='/images/1.jpg' />
        </div>
    );
}

export default App;
