import React from 'react';
import GreetingContainer from '../containers/greeting_container'
import SessionForm from '../containers/session_form_container'

export default class App extends React.Component{
  constructor(props){
    super(props);
  }

  render(){
    return (<div>
      <h1>Bench BnB</h1>
      <GreetingContainer/>
      <SessionForm/>
    </div>);
  }
}
