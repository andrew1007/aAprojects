import React from 'react';
import SessionContainer from './session/session_container'
import {hashHistory} from 'react-router';

export default class NavBar extends React.Component {
  constructor(){
    super()
    this.handleImageClick = this.handleImageClick.bind(this);
  }

  handleImageClick(e){
    e.preventDefault();
    hashHistory.push(`/home`)
  }

  render() {
    return(
    <div className="navigation-bar">
      <img className="interest-me-logo"
        onClick={this.handleImageClick}
        src="http://res.cloudinary.com/andoo/image/upload/v1484187051/Logomakr_2W78HQ_k95ah7.png"
        alt="Interest Me!">
      </img>
      <div className="flex-searchbar">
      </div>
      <div className="authentication">
        <SessionContainer/>
      </div>
    </div>
    )
  }
}
