import { useState } from "react";

const App = () => {
  const [count, setCount] = useState(0);

  const increment = () => setCount((prev) => prev + 1);

  return (
    <div>
      <button onClick={increment}>Increment</button>
      {count}
    </div>
  );
};

export default App;
