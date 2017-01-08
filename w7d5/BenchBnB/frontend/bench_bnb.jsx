import React from 'react';
import ReactDOM from 'react-dom';
import SessionReducer from './reducers/session_reducers';
import {signup, login, logout} from './actions/session_actions';
import rootReducer from './reducers/root_reducer';

document.addEventListener('DOMContentLoaded', () => {
  window.signup = signup
  window.login = login
  window.logout = logout
  window.SessionReducer = SessionReducer;
  const root = document.getElementById('root');
  ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
});
