import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store.js';
import { allTodos } from './reducers/selectors.js';
import {receiveTodos, receiveTodo} from './actions/todo_actions.js';
import Root from './components/root.jsx';


document.addEventListener("DOMContentLoaded", ()=> {
  let store = configureStore();
  window.store = store;
  window.allTodos = allTodos;
  window.receiveTodo = receiveTodo;
  ReactDOM.render(
    <Root store={store}/>,
    document.getElementById('root'));
});
