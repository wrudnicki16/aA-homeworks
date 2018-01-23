import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);

  store = applyMiddlewares(store, addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

const addLoggingToDispatch = store => next => action => {
  console.log('Store before action', store.getState());
  console.log(action);
  let result = next(action);
  console.log('Store after action', store.getState());
  return result;
};

const applyMiddlewares = (store, middleWares) => {
  let dispatch = store.dispatch;

  middleWares.forEach((middleWare) => {
    dispatch = middleWare(store)(dispatch);
  });

  return Object.assign({}, store, { dispatch });
};
