import React from 'react';
import Masonry from 'react-masonry-component'
import Modal from 'react-modal';
import PinContainer from '../pins/pins_container'

export default class Homepage extends React.Component{
  constructor(props){
    super(props)
    this.state={
      pinsReceieved: false,
      modalIsOpen: false,
      focusedPinId: null
    }
    document.body.style.overflow = "auto";
    this.handleTileClick = this.handleTileClick.bind(this);
    this.pinTileRender = this.pinTileRender.bind(this);
    this.masonryLayout = this.masonryLayout.bind(this);
    this.closeModal = this.closeModal.bind(this);
    this.handleSelfClose = this.handleSelfClose.bind(this);
  }

  closeModal() {
    this.setState({modalIsOpen: false});
    document.body.style.overflow = "auto";
  }

  componentWillMount(){
    this.props.getHome().then(() => {
      this.setState({pinsReceieved: true})
    })
  }

  handleTileClick(e) {
    e.preventDefault();
    const idx = e.currentTarget.name
    this.setState({focusedPinId: idx, modalIsOpen: true})
    document.body.style.overflow = "hidden";
  }

pinTileRender(){
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

  closeModal() {
    this.setState({modalIsOpen: false});
    document.body.style.overflow = "auto";
  }

  handleSelfClose(){
    this.setState({modalIsOpen: false})
    this.props.getHome()
    document.body.style.overflow = "auto";
  }

  render(){
    return(
      <div>
        <div className="homepage-welcome">
          Discover something interesting
        </div>
        {this.state.pinsReceieved ? this.masonryLayout() : null}
        <Modal
          isOpen={this.state.modalIsOpen}
          onAfterOpen={this.afterOpenModal}
          onRequestClose={this.closeModal}
          contentLabel="Modal"
          className="ReactModal__Content"
        >
          <PinContainer handleSelfClose={this.handleSelfClose} pinId={this.state.focusedPinId}/>
        </Modal>
      </div>
    )
  }
}
