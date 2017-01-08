import React from 'react';
import PostIndexItem from './post_index_item';
import PostFormContainer from './post_form_container';

class PostIndex extends React.Component {

  componentDidMount() {
    this.props.fetchPosts();
  }

  render () {
    return (
      <div>
      </div>
    );
  }
}

export default PostIndex;
