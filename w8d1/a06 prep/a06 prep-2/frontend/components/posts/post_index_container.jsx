import { connect } from 'react-redux';
import PostIndex from './post_index';
import { fetchPosts, deletePost, createPost } from '../../actions/post_actions';

const mapStatetoProps = (state)=> ({
  posts: Object.keys(state.posts).map(id => state.posts[id])
})

const mapDispatchtoProps = (dispatch) => ({
  fetchPosts: () => dispatch(() => fetchPosts()),
  deletePost: (post) => dispatch((post)=>deletePost(post)),
  createPost: (post) => dispatch((post) => createPost(post))
})

export default connect(mapStatetoProps)(mapDispatchtoProps)(PostIndex)
