import React, { useState } from 'react';
import './App.css';

function App() {
  const [data, setData] = useState(null);

  const fetchData = async () => {
    const response = await fetch('/api/data'); // Proxy to backend
    const result = await response.json();
    setData(result);
  };

  return (
    <div className="App">
      <header className="App-header">
        <button onClick={fetchData}>Click Me</button>
        {data && (
          <div>
            <p>Name: {data.name}</p>
            <p>Mobile: {data.mobile}</p>
            <p>Email: {data.email}</p>
          </div>
        )}
      </header>
    </div>
  );
}

export default App;