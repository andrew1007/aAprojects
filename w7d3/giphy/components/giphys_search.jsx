import React, { Component } from 'react';

import GiphysIndex from './giphys_index';

export default class GiphysSearch extends Component {

  constructor(props){
    super(props);
    this.state = {searchTerm: ""};
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleSubmit(){
    e.preventDefault();
    let buttonInput = this.state.searchTerm;
    this.props.fetchSearchGiphys(buttonInput);
  }

  handleChange(e){
    this.setState({searchTerm: e.currentTarget.value});
  }

  render(){
    return(
      <div>
        <form>
          <input value={this.state.searchTerm} onChange={this.handleChange} />
          <button type='submit' onClick={this.state.handleSubmit}
        </form>
      </div>
    );
  }
}
