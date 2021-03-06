import { RECEIVE_CURRENT_USER, RECEIVE_ERRORS } from '../actions/session_actions';
import merge from 'lodash/merge';

const defaultState = Object.freeze({currentUser: null, errors: []})


const SessionReducer = (state = defaultState, action) => {
  Object.freeze(state);
  switch(action.type){
    case RECEIVE_CURRENT_USER:
      const currentUser = action.currentUser;
      return merge({}, defaultState, {}, {currentUser});
    case RECEIVE_ERRORS:
      const errors = action.errors;
      return merge({}, defaultState, {errors});
  default:
    console.log("No actions hit. Defaulted");
    return
  }
}

export default SessionReducer;
