import {connect} from 'react-redux';
import { logout } from '../actions/session_actions';
import Greeting from './greeting_component';

//object attribute is session, found in state
const mapStateToProps = ({session}) => ({
  currentUser: session.currentUser
})
// returns an object
//this.props.currentUser is now available in presnetational comonent

//this.logout
const mapDispatchToProps = (dispatch) => ({
  logout: () => dispatch(logout())
})


export default connect(
  mapStateToProps,
  mapDispatchToProps)
  (Greeting)
