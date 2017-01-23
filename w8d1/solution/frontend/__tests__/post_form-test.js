/* globals jest */

jest.mock('../actions/post_actions');
const PostActions = require('../actions/post_actions');

import React from 'react';
import ReactDOM from 'react-dom';
import TestUtils from 'react-addons-test-utils';
import PostFormContainer from '../components/posts/post_form_container';
import { Provider } from 'react-redux';
import { createStore, applyMiddleware  } from 'redux';
import thunk from 'redux-thunk';

const fakePost = {
  id: 1,
  title: "Title",
  body: "Body"
};
const fakeReducer = (oldState, action) => ({ posts: { 1: fakePost } });
const fakeStore = createStore(fakeReducer, applyMiddleware(thunk));

describe('post form container', () => {
  let postFormNode;

  beforeEach(() => {
    PostActions.updatePost = jest.fn(post => dispatch => {});
    PostActions.fetchPost = jest.fn(id => dispatch => {});
    PostActions.createPost = jest.fn(post => dispatch => {});
  });

  describe('creating a new post', () => {
    beforeEach(() => {
      const root = (
        <Provider store={fakeStore}>
          <PostFormContainer formType="new" />
        </Provider>
      );

      postFormNode = document.createElement('div');
      ReactDOM.render(root, postFormNode);
    });

    it('pre-fills title and body input fields with empty string', () => {
      const inputNodes = postFormNode.querySelectorAll('input, textarea');
      const inputValues = [];

      for (let i = 0; i < inputNodes.length; i++) {
        if (inputNodes[i].value) {
          inputValues.push(inputNodes[i].value);
        }
      }

      // testing that no detectable default values have been provided
      expect(inputValues).toEqual(["Create Post"]);
    });

    it('updates the title and body fields when they change', () => {
      const inputNode = postFormNode.querySelector('input');

      TestUtils.Simulate.change(inputNode, {
        target: { value: 'telephone' }
      });

      expect(inputNode.value).toEqual('telephone');
    });

    it('triggers the correct action when submitted', () => {
      const form = postFormNode.querySelector('form');
      TestUtils.Simulate.submit(form);

      expect(PostActions.createPost).toBeCalled();
    });
  });

  describe('updating an existing post', () => {
    beforeEach(() => {
      const fakeParams = { formType: 'edit', postId: 1 };
      const root = (
        <Provider store={fakeStore}>
          <PostFormContainer params={fakeParams} />
        </Provider>
      );

      postFormNode = document.createElement('div');
      ReactDOM.render(root, postFormNode);
    });

    it('pre-fills title and body input fields with post data from the store', () => {
      const inputNodes = postFormNode.querySelectorAll('input, textarea');
      const inputValues = [];

      for (let i = 0; i < inputNodes.length; i++) {
        if (inputNodes[i].value) {
          inputValues.push(inputNodes[i].value);
        }
      }

      expect(inputValues).toContain(fakePost.title);
      expect(inputValues).toContain(fakePost.body);
    });

    it('triggers the correct action when submitted', () => {
      const form = postFormNode.querySelector('form');
      TestUtils.Simulate.submit(form);

      expect(PostActions.updatePost).toBeCalledWith(fakePost);
    });
  });
});
