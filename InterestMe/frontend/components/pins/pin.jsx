import React from 'react';
import Modal from 'react-modal';
import PinEditContainer from './pin_edit_container'
import {hashHistory} from 'react-router';

export default class Pin extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      editFormOpen: false,
      receivedPin: false,
      hasBeenDeleted: false
    };
    this.pinModal = this.pinModal.bind(this);
    this.handleEditButton = this.handleEditButton.bind(this);
    this.editPinModal = this.editPinModal.bind(this);
    this.closeModal = this.closeModal.bind(this);
    this.editButton = this.editButton.bind(this);
    this.childHandler = this.childHandler.bind(this);
    this.userProfileRedirect = this.userProfileRedirect.bind(this);
    this.handleBoardNameClick = this.handleBoardNameClick.bind(this);
    this.redirectToProfile = this.redirectToProfile.bind(this);
    this.pinAuthor = this.pinAuthor.bind(this);
  }

  componentWillReceiveProps(nextProps){

  }

  componentDidMount() {
    this.props.getPin(this.props.pinId).then(() => {
      this.setState({receivedPin: true, backdropOpen: true})
    })
  }

  handleEditButton() {
    if (this.state.editFormOpen){
      this.setState({editFormOpen: false})
    } else {
      this.setState({editFormOpen: true})
    }
  }

  editButton(){
    return (
        <button id="pin-edit-icon" onClick={this.handleEditButton}>
          edit
        </button>
    )
  }

  closeModal() {
    this.setState({
      editFormOpen: false});
  }

  childHandler() {
    this.setState({editFormOpen: false})
    console.log("ASdfasdf");
    this.props.handleSelfClose()
  }

  editPinModal() {
    return(
      <Modal
        isOpen={this.state.editFormOpen}
        onAfterOpen={this.afterOpenModal}
        onRequestClose={this.closeModal}
        contentLabel="Modal"
        className="ReactModal__Content__Pin"
      >
        <PinEditContainer handleChildCancelButton={this.childHandler} {...{pinId: this.props.pinId, boardId: this.props.pin.pins.pins.board_id}}/>
      </Modal>
    )
  }

  userProfileRedirect(){
    //TODO Maybe one day...
  }

  handleBoardNameClick(){
    this.props.handleSelfClose()
    hashHistory.push(`/boards/${this.props.pin.pins.pins.board_id}`)
    document.body.style.overflow = "auto"
  }

  pinModal(){
    return(
      <div className="modal-container">
          <div className="image-container">
            <div className="pin-edit-button">
            </div>
            <img className= "pin-modal-image" src={this.props.pin.pins.pins.image_url}></img>
          </div>
          <div className="title-user-container">
              <a className="important-text">
                <button className="important-text" onClick={this.handleBoardNameClick}>{this.props.pin.pins.pins.board_name}</button>
                </a>
                <br/>
              <div className="small-text">
                a board made by  <a className="link-set">{this.pinAuthor()}</a>
              </div>
            <div>
              {this.state.editFormOpen ? this.editPinModal() : null}
            </div>
          </div>
          <div className="pin-author-container">
            <b id="pin-title">{this.props.pin.pins.pins.title}</b>
            <p id="pin-body">{this.props.pin.pins.pins.body}</p>
          </div>
      </div>
    )
  }

  redirectToProfile(){
    this.props.handleSelfClose()
    hashHistory.push(`/user/${this.props.pin.pins.pins.author_id}`)
  }

  pinAuthor(){
    return (
      <div className="link-set">
        <button className="pin-author-button" onClick={this.redirectToProfile}>
          {this.props.pin.pins.pins.owner ? "you" : this.props.pin.pins.pins.author }
        </button>
        {this.props.pin.pins.pins.owner ? <button id="pin-edit-icon" onClick={this.handleEditButton}>
                  edit
                </button> : null }
      </div>
    )
  }

  render() {

    return(
      <div>
        {this.state.receivedPin ? this.pinModal() : null}
      </div>
    )
  }
}
