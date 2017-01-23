import React from 'react';
import {hashHistory} from 'react-router';

export default class BoardEdit extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      editBoxOpen: true,
      deleteConfirmBox: false,
      name: ''
    };
    console.log("ASdf")
    this.editButton = this.editButton.bind(this);
    this.handleEditButton = this.handleEditButton.bind(this);
    this.editForm = this.editForm.bind(this);
    this.update = this.update.bind(this);
    this.handleCancelButton = this.handleCancelButton.bind(this);
    this.confirmDeleteBox = this.confirmDeleteBox.bind(this);
    this.handleDeleteButton = this.handleDeleteButton.bind(this);
    this.handleDeleteConfirm = this.handleDeleteConfirm.bind(this);
    this.handleUpdateSubmit = this.handleUpdateSubmit.bind(this);
  }

  handleEditButton(){
    if (this.state.editBoxOpen || this.state.deleteConfirmBox){
      this.setState({editBoxOpen: false, deleteConfirmBox: false})
    } else{
      this.setState({editBoxOpen: true});
    }
  }

  handleCancelButton() {
    this.setState({deleteConfirmBox: false, editBoxOpen: false})
    this.forceUpdate();
  }

  editButton(){
    return (
      <div>
        <button id="edit-icon" onClick={this.handleEditButton}>
          edit
        </button>
      </div>
    )
  }

  update(text) {
    return e => this.setState({
      [text]: e.currentTarget.value
    });
  }

  handleDeleteButton() {
    this.setState({deleteConfirmBox: true, editBoxOpen: false})
  }

  handleDeleteConfirm() {
    this.props.deleteBoard({id: this.props.boardId});
    hashHistory.push('/home')
    this.forceUpdate()
  }

  handleUpdateSubmit(e) {
    e.preventDefault();
    this.setState({deleteConfirmBox: false, editBoxOpen: false})
    this.props.editBoard({name: this.state.name,
      id: this.props.boardId}).then(()=> {
        this.props.handleChildSubmit()
      })
  }

  editForm() {
    return (
      <div className="board-edit-form">
        <form onSubmit={this.handleUpdateSubmit}>
          <a>Edit name</a>
          <input
            autoFocus type='text' onChange={this.update('name')}
            />
            <button type="Submit" value="Submit">
              Update
            </button>
            <button onClick={this.handleCancelButton}>
              Cancel
            </button>
            <button onClick={this.handleDeleteButton}>
              Delete board
            </button>
        </form>
      </div>
    );
  }

  confirmDeleteBox() {
    return(
      <div className="delete-confirm-form">
        <div id="delete-confirm">Are you sure you want to delete this board?</div>
        <button className="confirm-delete-button" onClick={this.handleDeleteConfirm}>Yes</button>
        <button className="confirm-delete-button" onClick={this.handleCancelButton}>Cancel</button>
      </div>
    )
  }

  render() {
    return (
      <div>
        {this.editButton()}
        {this.state.editBoxOpen ? this.editForm() : null }
        {this.state.deleteConfirmBox ? this.confirmDeleteBox() : null}
      </div>
    )
  }
}
