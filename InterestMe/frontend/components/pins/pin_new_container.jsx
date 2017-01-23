import { connect } from 'react-redux';
import { createPin } from '../../actions/pin_actions';
import PinNewForm from './pin_new_form';

const mapStateToProps = (state) => ({
  
});

const mapDispatchToProps = (dispatch) => ({
  newPin: (pin) => dispatch(createPin(pin))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps)
  (PinNewForm);
