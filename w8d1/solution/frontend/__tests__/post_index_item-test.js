/* globals jest */

import React from 'react';
import PostIndexItem from '../components/posts/post_index_item';
import { Link } from 'react-router';
import { shallow } from 'enzyme';

describe('post index item', () => {
  let post,
      hashHistory,
      postIndexNode,
      deletePost;

  beforeEach(() => {
    post = {
      id: 1,
      title: "Title",
      body: "Body"
    };

    deletePost = jest.fn();
    hashHistory = require('react-router').hashHistory;
    hashHistory.push = jest.fn();

    const props = {
      deletePost,
      post
    };

    postIndexNode = shallow(<PostIndexItem {...props} />);
  });

  it('should be a function', () => {
    expect(typeof PostIndexItem).toEqual('function');
  });

  it('shows the post\'s title as a Link to the post\'s show page', () => {
    const showLink = postIndexNode.find(Link);

    expect(showLink.node.props.children).toEqual(`${post.title}`);
    expect(showLink.node.props.to).toEqual(`/posts/${post.id}`);
  });

  it('has a button that links to the post edit page', () => {
    const editButton = postIndexNode.find('button').filterWhere(button =>
      /edit/i.test(button.node.props.children)
    );
    expect(editButton).toBeDefined();

    // click on Edit link with mock event object
    editButton.simulate('click', { preventDefault() { } });
    expect(hashHistory.push).toBeCalledWith(`/posts/${post.id}/edit`);
  });

  it('has a button to delete post', () => {
    const deleteButton = postIndexNode.find('button').filterWhere(button =>
      /delete/i.test(button.node.props.children)
    );
    expect(deleteButton).toBeDefined();

    deleteButton.simulate('click');
    expect(deletePost).toBeCalledWith(post.id);
  });
});
