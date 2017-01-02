import { createStore } from 'redux';
import reducer from './reducer.js';
import { addOrange } from './actions.js';

const store = createStore(reducer);
window.store = store;
store.getState();
store.dispatch(addOrange);
store.getState();
store.dispatch(addApple);
store.getState();

const addLychee = { type: 'ADD_FRUIT', fruit: 'lychee' };
store.dispatch(addLychee);
store.getState();
