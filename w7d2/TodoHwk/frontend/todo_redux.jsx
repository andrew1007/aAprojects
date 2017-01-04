import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

const addLoggingToDispatch = (store) => (next) => (action) => {
  let currentDispatch = store.dispatch;
  console.log(store.getState());
  console.log(action);
  let actionDispatch = currentDispatch(action);
  console.log(store.getState());
  return actionDispatch;
};

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);
  const logger = addLoggingToDispatch(store);
  console.log(logger);
  console.log(store);
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
