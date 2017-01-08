/* globals jest */

import React from 'react';
import { createStore } from 'redux';
import PostShow from '../components/posts/post_show';
import { Link } from 'react-router';
import { shallow } from 'enzyme';

const fakePost = {
  id: 1,
  title: "Title",
  body: "Body"
};
const fakeReducer = (oldState, action) => ({ posts: { 1: fakePost } });
const fakeStore = createStore(fakeReducer);

describe('post show', () => {
  let postShowNode;

  beforeEach(() => {
    postShowNode = shallow(<PostShow store={fakeStore} post={fakePost} />);
  });

  it('contains the post information', () => {
    const renderedText = postShowNode.text();

    expect(renderedText).toContain(fakePost.title);
    expect(renderedText).toContain(fakePost.body);
  });

  it('has a link to the post index', () => {
    const showLink = postShowNode.find(Link);

    expect(showLink).toBeDefined();
    expect(showLink.node.props.to).toEqual('/');
  });
});
