import React from 'react';
import Masonry from 'react-masonry-component'
import Modal from 'react-modal';
import BoardEditContainer from './board_edit_container'
import PinContainer from '../pins/pins_container'
import PinNewContainer from '../pins/pin_new_container'
import Dropzone from 'react-dropzone'
import request from 'superagent';
const CLOUDINARY_PRESET = 'punlriir'
const CLOUDINARY_UPLOAD ='https://api.cloudinary.com/v1_1/andoo/upload'

export default class Board extends React.Component {

  constructor(props) {
    super(props)
    this.state= {
      modalIsOpen: false,
      focusedPinId: null,
      pin: null,
      owner:this.props.board.owner,
      newPinFormOpen: false,
      finishedLoading: false,
      imageUrl: null,
      body: "",
      title: "",
      editFormOpen: false
    }
    document.body.style.overflow = "auto"
    this.handleTileClick = this.handleTileClick.bind(this);
    this.pinTileRender = this.pinTileRender.bind(this);
    this.masonryLayout = this.masonryLayout.bind(this);
    this.boardText = this.boardText.bind(this);
    this.closeModal = this.closeModal.bind(this);
    this.handleOpenNewPin = this.handleOpenNewPin.bind(this);
    this.handleSelfClose = this.handleSelfClose.bind(this);
    this.handleChildSubmit = this.handleChildSubmit.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.update = this.update.bind(this);
    this.handleDrop = this.handleDrop.bind(this);
    this.previewImage = this.previewImage.bind(this);
    this.handleEditButtonOpen = this.handleEditButtonOpen.bind(this);
    this.handleDrop = this.handleDrop.bind(this)
  }

  // cloudinary(e){
  //   e.preventDefault();
  //   const that = this
  //   cloudinary.openUploadWidget(
  //     {
  //       cloud_name:'andoo',
  //       upload_preset: 'punlriir',
  //       theme: 'minimal'
  //     },
  //     (errors, results) => {
  //       if (errors === null) {
  //         that.setState({imageUrl: results[0]})
  //       }
  //     }
  //   )
  // }


  handleDrop(img){
    let imgUploaded = img[0]
    let upload = request.post(CLOUDINARY_UPLOAD)
    .field('upload_preset', CLOUDINARY_PRESET)
    .field('file', img);
    upload.end((errors, results) => {
      debugger;
      if (errors === null) {
        debugger;
        this.setState({imageUrl: results.body.secure_url})
      } else {
        console.log("error uploading!");
      }
    })
  }

  handleChildCancelButton(){
    this.closeModal()
    this.props.getPins(nextProps.boardId)
  }

  handleSubmit(e) {
    debugger;
    e.preventDefault();
    this.setState({newPinFormOpen: false})

    this.props.newPin({
      title: this.state.title,
      body: this.state.body,
      board_id: parseInt(this.props.boardId),
      image_url: this.state.imageUrl})

  }

  update(text) {
    return e => this.setState({
      [text]: e.currentTarget.value
    });
  }

  previewImage() {
    debugger;
    return (
    <div className="original-filename">
      {this.state.imageUrl ? null :
        <div className="upload-mini-text">
          image preview
        </div>}
      { this.state.imageUrl ?
          <img className="image-preview" src={this.state.imageUrl}/>
          : null}
      </div>
    )
  }

  newPinForm() {
    // <button
    //   onClick={this.cloudinary}
    //   className="upload-mini-text">
    //   { this.state.imageUrl ?
    //     "click to upload different image"
    //     :
    //     "click to upload image"
    //   }
    // </button>
    return (
      <div>
        <div className="click-to-upload">
            <br/>
        </div>
        <Dropzone
          multiple={false}
          accept="image/*"
          onDrop={this.handleDrop}
          className="image-preview"
        >
          {this.state.imageUrl ? this.previewImage() : "click or drag to add image"}

        </Dropzone>

        <form onSubmit={this.handleSubmit}>
          <div className="new-pin-form">
            <a>Title</a>
            <br></br>
            <input onChange={this.update('title')}/>
            <br></br>
            <a>Body</a>
            <br></br>
            <textarea className="new-pin-textarea" type="textarea" onChange={this.update('body')}/>
            <br></br>
            <button type="Submit" value="Submit">Post</button>
          </div>
          </form>
      </div>

    )
  }

  openNewPinForm(){
    return(
      <Modal
        isOpen={this.state.newPinFormOpen}
        onAfterOpen={this.afterOpenModal}
        onRequestClose={this.closeModal}
        contentLabel="Session form"
        className="new-pin-modal ReactModal__Content"
        >
          {this.newPinForm()}
      </Modal>
    )
  }

  componentWillReceiveProps(nextProps) {
    if (this.props.boardId !== nextProps.boardId){
      this.props.getBoard(nextProps.boardId)
      this.props.getPins(nextProps.boardId)
    }
  }

  componentWillMount() {
    this.props.getPins(this.props.boardId).then( () => {
      this.props.getBoard(this.props.boardId)
    }).then( () => {
      this.setState({finishedLoading : true})
    })
  }

  handleTileClick(e) {
    e.preventDefault();
    const idx = e.currentTarget.name
    this.setState({focusedPinId: idx, modalIsOpen: true})
    document.body.style.overflow = "hidden";
  }

  pinTileRender(){
     ;
    return(
      this.props.pins.pins.map( (tile, idx) => {
        return(
          <div key={idx} className="pin-tile">
            <button className="board-tile-pic" name={tile.id} onClick={(e) => this.handleTileClick(e)}>
              <img src={tile.image_url}/>
            </button>
          </div>
        )
      })
    )
  }

  masonryLayout(){
    var masonryOptions = {
      fitWidth: true
    };
    return (
      <div>
        <div>
          <div>
            <Masonry
              elementType={'div'}
              disableImagesLoaded={false}
              className='board'
              options={masonryOptions}
              >
              {this.pinTileRender()}
            </Masonry>
        </div>
      </div>
    </div>
    )
  }

  boardText(){
    return this.props.board.owner ? "you" : this.props.board.author
  }

  handleOpenNewPin(){
    this.setState({newPinFormOpen: true})
  }

  handleChildSubmit(){
    this.props.getBoard(this.props.boardId)
  }

  boardTitle(){
    return(
      <div className="board-overhead-bar">
        <a id="board-name">
          {this.props.board.name}
        </a>
        <div className="author-edit-flexbox">
          <a id="board-author">a board by {this.props.board ? this.boardText() : null} </a>
          <div className="owner-edit-buttons">
            {this.props.board.owner? <button onClick={this.handleEditButtonOpen}>edit</button> : null }
            {this.props.board.owner ? <button onClick={this.handleOpenNewPin}>new pin</button> : null}
          </div>
        </div>
      </div>
    )
  }

  handleEditButtonOpen(){
    if (this.state.editFormOpen) {
      this.setState({editFormOpen: false})
    } else {
      this.setState({editFormOpen: true})
    }
  }

  closeModal() {
    this.setState({modalIsOpen: false, newPinFormOpen: false});
    document.body.style.overflow = "auto";
  }

  handleSelfClose(){
    this.setState({modalIsOpen: false})
    this.props.getPins(this.props.boardId)
  }

  render() {
    return (
      <div>
        { this.state.finishedLoading ? this.boardTitle() : null }
          {this.masonryLayout()}
        { this.state.newPinFormOpen ? this.openNewPinForm() : null}
        <Modal
          isOpen={this.state.modalIsOpen}
          onAfterOpen={this.afterOpenModal}
          onRequestClose={this.closeModal}
          contentLabel="Modal"
          className="ReactModal__Content"
        >
          <PinContainer pinId={this.state.focusedPinId} handleSelfClose={this.handleSelfClose}/>
        </Modal>
        { this.state.editFormOpen ? <BoardEditContainer handleChildSubmit={this.handleChildSubmit} {...this.props}/> : null}
      </div>
    )
  }
}
