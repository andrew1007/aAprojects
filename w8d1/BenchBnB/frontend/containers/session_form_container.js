import {connect} from 'react-redux';
import { login } from '../actions/session_actions';
import SessionForm from './session_form_component';


const mapStateToProps = ({session}) => ({
  currentUser: session.currentUser
});

const mapDispatchToProps = (dispatch) => ({
  processForm: (user) => dispatch(login(user))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps)
  (SessionForm)
