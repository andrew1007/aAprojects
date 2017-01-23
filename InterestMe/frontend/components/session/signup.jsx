import React from 'react';
import Modal from 'react-modal';


export default class Signup extends React.Component {
  constructor(){
    super();
    document.body.style.overflow = "hidden";
  }

  render(){
    return(
      <div className="splash-container">
        <img className="splashscreen" src="http://res.cloudinary.com/andoo/image/upload/v1484767938/tb4wis6xoqk-aaron-burden_cf5rfx.jpg"/>
        <div className="splashtext">
          Let's share something interesting
        </div>
      </div>
    )
  }
}
