/* globals jest */

import PostsReducer from '../reducers/posts_reducer';
import RootReducer from '../reducers/root_reducer';
import { createStore } from 'redux';

describe('Reducers', () => {
  describe('PostsReducer', () => {
    it('exports an function', () => {
      expect(typeof PostsReducer).toEqual('function');
    });

    it('should initialize with an empty object as the default state', () => {
      expect(PostsReducer(undefined, {})).toEqual({});
    });

    it('should return the previous state if an action is not matched', () => {
      const oldState = { 1: 'oldState' };
      const newState = PostsReducer(oldState, { type: 'unmatchedtype' });
      expect(newState).toEqual(oldState);
    });

    describe('handling the RECEIVE_ALL_POSTS action', () => {
      let action,
          fakePosts;

      beforeEach(() => {
        fakePosts = { 1: 'fakePost1', 2: 'fakePost2' };
        action = {
          type: 'RECEIVE_ALL_POSTS',
          posts: fakePosts
        };
      });

      it('should replace the state with the action\'s posts', () => {
        const state = PostsReducer(undefined, action);
        expect(state).toEqual(fakePosts);
      });

      it('should not modify the old state', () => {
        let oldState = { 1: 'oldState' };
        PostsReducer(oldState, action);
        expect(oldState).toEqual({ 1: 'oldState' });
      });
    });

    describe('handling the RECEIVE_POST action', () => {
      let action,
          fakePost;

      beforeEach(() => {
        fakePost = { id: 1, title: 'fakePost' };
        action = {
          type: 'RECEIVE_POST',
          post: fakePost
        };
      });

      it('should add the post to the state using the post id as a key', () => {
        let state = PostsReducer(undefined, action);
        expect(state[1]).toEqual(fakePost);
      });

      it('should not affect the other posts in the state', () => {
        let oldState = { 2: 'oldState' };
        let state = PostsReducer(oldState, action);
        expect(state[2]).toEqual('oldState');
      });
    });

    describe('handling the REMOVE_POST action', () => {
      let action,
          fakePost;

      beforeEach(() => {
        fakePost = { id: 1, title: 'fakePost' };
        action = {
          type: 'REMOVE_POST',
          post: fakePost
        };
      });

      it('should remove the correct post from the state', () => {
        let state = PostsReducer({ 1: fakePost }, action);
        expect(typeof state[1]).toEqual('undefined');
      });

      it('should not affect the other posts in the state', () => {
        let oldState = { 1: fakePost, 2: 'oldState' };
        let state = PostsReducer(oldState, action);
        expect(state[2]).toEqual('oldState');
      });
    });
  });

  describe('RootReducer', () => {
    let fakeStore;

    beforeAll(() => {
      fakeStore = createStore(RootReducer);
    });

    it('exports a function', () => {
      expect(typeof RootReducer).toEqual('function');
    });

    it('includes the PostsReducer under the key `posts`', () => {
      const post = { id: 1, title: 'Root Reducer', content: 'Testing' };
      const action = { type: 'RECEIVE_POST', post };
      fakeStore.dispatch(action);

      expect(fakeStore.getState().posts).toEqual(PostsReducer({ [post.id]: post }, action));
    });
  });

});
