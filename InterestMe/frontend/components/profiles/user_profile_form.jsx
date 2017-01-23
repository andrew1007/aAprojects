import React from 'react';
import Modal from 'react-modal';
import {hashHistory} from 'react-router';

export default class UserProfileForm extends React.Component {
  constructor(props) {
    super(props);
    this.state= {
      imageUrl: this.props.user.user.profile_picture,
      email: ""
    }
    //
    this.handleSubmit = this.handleSubmit.bind(this);
    this.update = this.update.bind(this);
    this.cloudinary = this.cloudinary.bind(this);
    this.previewImage = this.previewImage.bind(this);
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
      this.props.editProfilePage({
        id: this.props.userId,
        email: this.state.email,
        profile_picture: this.state.imageUrl.url
      })
      this.props.handleSelfClose()
    }

    update(text) {
      return e => this.setState({
        [text]: e.currentTarget.value
      });
    }

    previewImage() {
      return (
      <div className="original-filename">
        {this.state.imageUrl ? null :
          <div className="upload-mini-text">
            image preview
          </div>}
        { this.state.imageUrl ?
            <img className="image-preview" src={this.state.imageUrl.url}/>
            : null}
        </div>
      )
    }

    render() {
      return (
        <div>
          <div className="image-preview">
            {this.previewImage()}
          </div>
          <div className="click-to-upload">
              <button
                onClick={this.cloudinary}
                className="upload-mini-text">
                { this.state.imageUrl ?
                  "click to upload different image"
                  :
                  "click to upload image"
                }
              </button>
              <br/>
          </div>
          <form onSubmit={this.handleSubmit}>
            <div className="new-pin-form">
              <a>email</a>
              <br></br>
              <input onChange={this.update('email')}/>
              <br></br>
              <button type="Submit" value="Submit">Post</button>
            </div>
            </form>
        </div>
      )
    }
}
