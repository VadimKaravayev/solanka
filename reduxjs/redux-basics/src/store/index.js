import { configureStore } from "@reduxjs/toolkit";
import counterReducer from "./reducers/counterReducer";

const store = configureStore({
  reducer: counterReducer,
});

console.log(store.getState());
store.dispatch({ type: "counter/increment" });
console.log(store.getState());

const incrementCounter = () => ({ type: "counter/increment" });

store.dispatch(incrementCounter());
console.log(store.getState());

export { store };
