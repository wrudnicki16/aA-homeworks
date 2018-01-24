import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import {fetchSearchGiphys} from './util/api_util';
import {receiveSearchGiphys} from './actions/giphy_actions';


const store = configureStore();

window.store = store;
window.fetchSearchGiphys = fetchSearchGiphys;
window.receiveSearchGiphys = receiveSearchGiphys;

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<Root store={store} />, document.getElementById('root'));
});
