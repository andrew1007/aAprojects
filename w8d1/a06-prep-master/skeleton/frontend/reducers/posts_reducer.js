import { RECEIVE_ALL_POSTS,
         RECEIVE_POST,
         REMOVE_POST } from '../actions/post_actions';
import merge from 'lodash/merge';

const PostsReducer = (oldState = {}, action) => {
  Object.freeze(oldState);
  switch(action.type){
    case RECEIVE_ALL_POSTS:
      let posts = action.posts;
      return merge({}, posts);
    case RECEIVE_POST:
      let post = action.post;
      return merge({}, oldState, {[post.id]: post});
    case REMOVE_POST:
      let newState = merge({}, oldState);
      delete newState[action.post.id]
      return newState
    default:
      return oldState;
  }
};

export default PostsReducer;
