import {combineReducers} from 'redux';
import SessionReducer from './session_reducers';

//adds to state
const rootReducer = combineReducers({
  session: SessionReducer
});

export default rootReducer;
