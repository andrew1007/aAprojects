import { Router, Route, IndexRoute, hashHistory } from 'react-router';
import React from 'react'
import App from './app';
import {Provider} from 'react-redux';

const Root = ({ store }) => (
    <Provider store={ store }>
      <Router history={hashHistory}>
        <Route path="/" component={App}/>
      </Router>
    </Provider>
)

export default Root;
