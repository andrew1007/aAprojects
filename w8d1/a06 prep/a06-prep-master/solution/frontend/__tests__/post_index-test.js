/* globals jest */

import React from 'react';
import { shallow } from 'enzyme';
import PostIndexContainer from '../components/posts/post_index_container';
import PostIndexItem from '../components/posts/post_index_item';
import PostFormContainer from '../components/posts/post_form_container';
import TestUtils from 'react-addons-test-utils';
import { createStore } from 'redux';

import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';

const posts = [
  { id: 1, title: "Title1" },
  { id: 2, title: "Title2" },
  { id: 3, title: "Title3" }
];
const fakeReducer = (oldState, action) => ({ posts });
const fakeStore = createStore(fakeReducer);

describe('post index', () => {
  let postIndexNode;

  beforeEach(() => {
    // shallow render allows us to unit test only highest level component
    //    i.e. test PostIndex independently of PostIndexItem
    postIndexNode = shallow(<PostIndexContainer store={fakeStore} params={posts}/>).shallow();
  });


  it('renders a PostIndexItem for each post, passing in each post as a "post" prop', () => {
    const postIndexItems = postIndexNode.find(PostIndexItem).nodes;
    expect(postIndexItems.length).toBe(3);

    // tests that each PostIndexItem has correct props
    for(let i = 0; i < postIndexItems.length; i++) {
      expect(postIndexItems[i].props.post).toBe(posts[i]);
    }
  });

  it('contains a PostForm component', () => {
    const postForm = postIndexNode.find(PostFormContainer).nodes;
    expect(postForm.length).toBe(1);
  });
});