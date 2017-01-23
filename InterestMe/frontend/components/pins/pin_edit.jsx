import React from 'react';

export default class PinEdit extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      editFormOpen: true,
      title: '',
      body: '',
      deleteConfirmBox: false,
      modalIsOpen: false
    };
    this.editForm = this.editForm.bind(this);
    this.update = this.update.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.deleteConfirm = this.deleteConfirm.bind(this);
    this.updateButtonSet = this.updateButtonSet.bind(this);
    this.handleDeleteButton = this.handleDeleteButton.bind(this);
    this.handleDeleteConfirmCancel = this.handleDeleteConfirmCancel.bind(this);
    this.handleDeleteSubmit = this.handleDeleteSubmit.bind(this);
  }

  handleDeleteButton(){
    this.setState({deleteConfirmBox: true})
  }

  handleSubmit() {
    this.props.editPin({title: this.state.title,
      body: this.state.body,
      id: this.props.pinId,
      board_id: this.props.boardId})
      this.props.handleChildCancelButton()
  }

  update(text) {
    return (e) => this.setState({
      [text]: e.currentTarget.value
    })
  }

  editForm() {
    return (
      <div className="pin-edit-form">
        <form onSubmit={this.handleSubmit}>
          <a id="pin-edit-title">Edit Pin</a>
          <br/>
          <br/>
          Title
          <br/>
          <input
            autoFocus type='text' onChange={this.update('title')}/>
          <br/>
          Body
          <br/>
          <textarea
            autoFocus type='textarea' onChange={this.update('body')}/>
            <div>
              {
                this.state.deleteConfirmBox ?
                this.deleteConfirm() : this.updateButtonSet()
              }
            </div>
        </form>
      </div>
    );
  }

  handleDeleteSubmit(){
    this.props.deletePin(this.props.pinId);
    this.setState({deleteConfirmBox: false})
    this.props.handleChildCancelButton()
  }

  handleDeleteConfirmCancel(){
    this.setState({deleteConfirmBox: false})
  }

  deleteConfirm() {
    return(
      <div className='pin-delete-confirm'>
        <button onClick={this.handleDeleteSubmit}>Delete</button>
        <button onClick={this.handleDeleteConfirmCancel}> Cancel</button>
        <br/>
        Are you sure you want to delete?
      </div>
    )
  }

  updateButtonSet(){
    return(
      <div>
        <button type="Submit" value="Submit">
        Update
      </button>
        <button onClick={this.props.handleChildCancelButton}>
          Cancel
        </button>
        <button onClick={this.handleDeleteButton}>
          Delete Pin
        </button>
      </div>
    )
  }

  render(){
    return(
      <div>
        { this.state.editFormOpen ? this.editForm() : null }
      </div>
    )
  }
}
