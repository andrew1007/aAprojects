import React from 'react';
import ReactDOM from 'react-dom';
import SessionReducer from './reducers/session_reducers';
import {signup, login, logout} from './actions/session_actions';
import rootReducer from './reducers/root_reducer';
import configureStore from './store/store';
import Root from './components/root'

document.addEventListener('DOMContentLoaded', () => {
  window.signup = signup
  window.login = login
  window.logout = logout
  window.SessionReducer = SessionReducer;
  const store = configureStore();
  window.store = store;
  // debugger;
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, root);
});
