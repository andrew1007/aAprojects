import React from 'react';
import ReactDOM from 'react-dom';
import Tabs from './tabs';

const Panes = [
  {title: 'one', content: 'first'},
  {title: 'two', content: 'second'},
  {title: 'three', content: 'third'}
]

class Root extends React.Component {
  render() {
    return(
      <div>
        <Tabs panes=Panes/>
      </div>
    );
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Root/>, document.getElementById('main'));
});
