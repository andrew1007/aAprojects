import React from 'react';
import { Link } from 'react-router';

export default class SessionForm extends React.Component{
  constructor(props){
    super(props);
    this.state = {
      username: "",
      password: ""
    };
    this.change = this.change.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  handleSubmit(e){
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  change(field){
    if (field === 'username'){
      return e => (this.state.username = e.currentTarget.value)
    } else {
      return e => (this.state.password = e.currentTarget.value)
    }
  }

  loggedOut(){
    return(
      <div className="asdf">
        <Link to='/signup'>Sign Up</Link>
        <Link to='/login'>Login</Link>
      </div>
    )
  }

  render(){
    return(
      <div className="i">
        <form onSubmit={this.handleSubmit}>
          <label> Username:
            <input type="text"
              value={this.state.username}
              onChange={this.change("username")}
              className="login-input" />
          </label>
          <br/>
          <label> Password:
            <input type="password"
              value={this.state.password}
              onChange={this.change("password")}
              className="login-input" />
          </label>
          <button type='submit' value='Submit'>submit</button>
        </form>
      </div>
    )
  }
}
