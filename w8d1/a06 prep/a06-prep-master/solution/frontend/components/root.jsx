import React from 'react';
import { Provider } from 'react-redux';
import { Router, Route, hashHistory, IndexRoute } from 'react-router';

import App from './app';
import PostIndexContainer from './posts/post_index_container';
import PostFormContainer from './posts/post_form_container';
import PostShowContainer from './posts/post_show_container';

const Root = ({ store }) => (
  <Provider store={store}>
    <Router history={hashHistory}>
      <Route path="/" component={App}>
        <IndexRoute component={PostIndexContainer} />
        <Route path="/posts" component={PostIndexContainer} />
        <Route path="/posts/:postId" component={PostShowContainer} />
        <Route path="/posts/:postId/edit" component={PostFormContainer} />
      </Route>
    </Router>
  </Provider>
);

export default Root;