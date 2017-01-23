import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from './store/store';
import { login, signup, logout } from './actions/session_actions'
import { createBoard, deleteBoard, editBoard, getBoard, getCurrentUser } from './actions/board_actions'
import { deletePin, editPin, getPins } from './actions/pin_actions'
import { createPin } from './util/ajax_request'

document.addEventListener('DOMContentLoaded', () => {
  window.signup = signup
  window.login = login;
  window.logout = logout;
  window.createPin = createPin;
  window.deletePin = deletePin;
  window.editPin = editPin;
  window.getPins = getPins;
  window.getCurrentUser = getCurrentUser;
  let store;
  if (window.currentUser) {
    const preloadedState = { session: { currentUser: window.currentUser } };
    store = configureStore(preloadedState);
  } else {
    store = configureStore();
  }
  window.store = store;
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, root)
})
