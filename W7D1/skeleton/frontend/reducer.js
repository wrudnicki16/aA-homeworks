const initialState = {
  baseCurrency: "Please select",
  rates: {}
};

const reducer = (state = initialState, action) => {
  switch(action.type) {
    case "SWITCH_CURRENCY":
      return {
        rates: action.rates,
        baseCurrency: action.baseCurrency
      };

    default:
      return state;
  }

};

export default reducer;
