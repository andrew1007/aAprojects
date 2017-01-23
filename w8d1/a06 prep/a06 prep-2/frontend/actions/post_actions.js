import * as PostApiUtil from '../util/post_api_util';
import { hashHistory } from 'react-router';
export const RECEIVE_ALL_POSTS = 'RECEIVE_ALL_POSTS';
export const RECEIVE_POST = 'RECEIVE_POST';
export const REMOVE_POST = 'REMOVE_POST';

export const fetchPosts = (posts) => (dispatch) => (
  PostApiUtil.fetchPosts().then((posts) => dispatch(receiveAllPosts(posts)))
)

export const fetchPost = (post) => (dispatch) => (
  PostApiUtil.fetchPost(post).then((post => dispatch(receivePost(post))))
)

export const createPost = (post) => (dispatch) => (
  PostApiUtil.createPost(post).then((post) => dispatch(receivePost(post)))
)

export const updatePost = (post) => (dispatch) => (
  PostApiUtil.updatePost(post).then((post) => dispatch(receivePost(post)))
)

export const deletePost = (post) => (dispatch) => (
  PostApiUtil.deletePost(post).then((post) => dispatch(removePost(post)))
)
const receiveAllPosts = (posts) => ({
  type: RECEIVE_ALL_POSTS,
  posts
})

const receivePost = (post) => ({
  type: RECEIVE_POST,
  post
})

const removePost = (post) => ({
  type: REMOVE_POST,
  post
})
