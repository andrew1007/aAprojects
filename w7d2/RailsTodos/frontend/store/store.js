import { createStore } from 'redux';
import RootReducer from '../reducers/root_reducer';
import { applyMiddleware} from 'redux';
import thunk from '../middleware/thunk';

const configureStore = (preloadedState = {}) => {
  const store = createStore(RootReducer, preloadedState, applyMiddleware(thunk));
  return store;
};

export default configureStore;
