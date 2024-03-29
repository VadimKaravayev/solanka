const initialState = { value: 0 };

const counterReducer = (state = initialState, action) => {
  if (action.type === "counter/increment") {
    return {
      ...state,
      value: state.value + 1,
    };
  }
  return state;
};

export default counterReducer;
