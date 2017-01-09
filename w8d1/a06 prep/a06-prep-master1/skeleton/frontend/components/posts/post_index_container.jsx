import { connect } from 'react-redux';
import PostIndex from './post_index';
import { fetchPosts, deletePost, createPost } from '../../actions/post_actions';

const mapStatetoProps = state =>({
  posts: Object.keys(state.posts).map(id => state.posts[id])
});

const mapDispatchtoProps = dispatch => ({
  fetchPosts: () => dispatch(fetchPost()),
  fetchPost: (post) => dispatch(fetchPost(post)),
  createPost: (post) => dispatch(createPost(post)),
  updatePost: (post) => dispatch(updatePost(post)),
  deletePost: (id) => dispatch(deletePost(id))
});

export default connect(mapStatetoProps, mapDispatchtoProps)(PostIndex);
