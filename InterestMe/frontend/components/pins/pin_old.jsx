import React from 'react';

export default class Pin extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      editFormOpen: false,
      title: '',
      body: '',
      deleteConfirmBox: false,
      modalIsOpen: false
    };
    this.handleEditButton = this.handleEditButton.bind(this);
    this.update = this.update.bind(this);
    this.handleEditSubmit = this.handleEditSubmit.bind(this);
    this.handleDeleteButton = this.handleDeleteButton.bind(this);
    this.handleCancelButton = this.handleCancelButton.bind(this);
    this.handleDeleteSubmit = this.handleDeleteSubmit.bind(this);
    this.deleteConfirm = this.deleteConfirm.bind(this);
    this.handleDeleteConfirmCancelButton = this.handleDeleteConfirmCancelButton.bind(this);
  }

  update(text) {
    return (e) => this.setState({
      [text]: e.currentTarget.value
    })
  }

  handleEditSubmit() {
    this.props.editPin({title: this.state.title,
      body: this.state.body,
      id: this.props.focusedPinId,
      board_id: this.props.pin.board.board_id})
  }

  handleEditButton() {
    if (this.state.editFormOpen){
      this.setState({editFormOpen: false})
    } else {
      this.setState({editFormOpen: true})
    }
  }

  pinModal(){
    return(
      <div className="modal-container">
          <div className="image-container">
            <div className="pin-edit-button">
            </div>
            <img src={this.props.pin.image.full_image}></img>
          </div>

          <div className="pin-author-container">
            <a>A pin by {this.props.pin.user.owner ? "you" : this.props.pin.user.author }</a>
            {this.props.pin.user.owner ? this.editButton() : null}
            <div>
              {this.state.editFormOpen ? this.editForm() : null}
            </div>
          </div>
          {this.state.editFormOpen ? null :
            <div>
              <b id="pin-title">{this.props.pin.pin.title}</b>
              <p id="pin-body">{this.props.pin.pin.body}</p>
            </div>
          }
      </div>
    )
  }

  handleDeleteSubmit(){
    this.props.deletePin(this.props.focusedPinId);
    this.setState({modalIsOpen: false});
  }

  deleteConfirm() {
    return(
      <div className='pin-delete-confirm'>
        Are you sure you want to delete?
        <button onClick={this.handleDeleteSubmit}>Delete</button>
        <button onClick={this.handleDeleteConfirmCancelButton}>Cancel</button>
      </div>
    )
  }

  handleCancelButton() {
    this.setState({editFormOpen: false})
  }

  handleDeleteConfirmCancelButton(){
    this.setState({deleteConfirmBox: false})
  }

  handleDeleteButton() {
    this.setState({deleteConfirmBox: true})
  }

  editForm() {
    return (
      <div className="pin-edit-form">
        <form onSubmit={this.handleEditSubmit}>
          <a id="pin-edit-title">Edit Pin</a>
          <br/>
          <br/>
          Title
          <input
            autoFocus type='text'onChange={this.update('title')}/>
          Body
          <textarea
            autoFocus type='textarea' onChange={this.update('body')}/>
          {this.state.deleteConfirmBox ? this.deleteConfirm() :
            <div>
              <button type="Submit" value="Submit">
                Update
              </button>
              <button onClick={this.handleCancelButton}>
                Cancel
              </button>
              <button onClick={this.handleDeleteButton}>
                Delete Pin
              </button>
            </div>
          }
        </form>
      </div>
    );
  }

  editButton(){
    return (
        <button id="pin-edit-icon"onClick={this.handleEditButton}>
          edit
        </button>
    )
  }


  render() {
    return(
      <div>
        {this.state.modalIsOpen ? this.pinModal() : null}
      </div>
    )
  }
}
