import { combineReducers } from 'redux';
import PostsReducer from './posts_reducer';

const RootReducer = combineReducers({
  posts: PostsReducer
})

export default RootReducer
