import React from 'react';
import {Router} from 'react-router';
import Dropzone from 'react-dropzone'

export default class PinNewForm extends React.Component {
  constructor(){
    super()
    this.state = {
      imageUrl: null,
      body: "",
      title: ""
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.update = this.update.bind(this);
    this.cloudinary = this.cloudinary.bind(this);
  }

  cloudinary(e){
    e.preventDefault();
    const that = this
    cloudinary.openUploadWidget(
      {
        cloud_name:'andoo',
        upload_preset: 'punlriir',
        theme: 'minimal'
      },
      (errors, results) => {
        if (errors === null) {
          that.setState({imageUrl: results[0]})
        }
      }
    )
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.newPin({
      title: this.state.title,
      body: this.state.body,
      board_id: parseInt(this.props.boardId),
      image_url: this.state.imageUrl.url})
      this.handleCancelButton()
  }

  update(text) {
    return e => this.setState({
      [text]: e.currentTarget.value
    });
  }


  render() {
    return (
      <div>
        <div className="image-preview">
          <div className="original-filename">
            {this.state.imageUrl ? <div>ddddddddddd</div> :
              <button onClick={this.cloudinary} className="upload-text">
                click here to upload image
              </button>}

            </div>
        </div>
        <form onSubmit={this.handleSubmit}>
          <div className="new-pin-form">
            <a>Title</a>
            <br></br>
            <input onChange={this.update('title')}/>
            <br></br>
            <a>Body</a>
            <br></br>
            <input onChange={this.update('body')}/>
            <br></br>
            <button type="Submit" value="Submit">Post</button>
          </div>
          </form>
      </div>

    )
  }
}
