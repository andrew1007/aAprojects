import React from 'react';
import { Link } from 'react-router';


export default class Greeting extends React.Component{
  constructor(props){
    super(props);
    this.logout = this.props.logout.bind(this);
  }

  notLoggedIn(){
    return (<nav>
      <Link to="/signup" className="dog">Sign Up</Link>
      <Link to="/login" className="dog">Sign In</Link>
    </nav>);
  }

  loggedIn(){
    // debugger;
    return (<nav>
      <button onClick={this.logout}>Logout</button>
      <h3>Welcome, {this.props.currentUser.username}</h3>
    </nav>);
  }

  render(){
    return (this.props.currentUser ? this.loggedIn() : this.notLoggedIn());
  }
}
