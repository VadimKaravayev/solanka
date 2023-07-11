import { useState } from "react";

function Counter() {
  const [counter, setCounter] = useState(0);

  const increment = () => setCounter((prevConter) => prevConter + 1);

  return (
    <div>
      Value {counter} <button onClick={increment}>Increment</button>
    </div>
  );
}

export default Counter;
