import React from 'react';
import Masonry from 'react-masonry-component'
import Modal from 'react-modal';


export default class Board extends React.Component {

  constructor(props) {
    super(props)
    this.state= {
      modalIsOpen: false
    }
    this.handleTileClick = this.handleTileClick.bind(this);
  }

  handleTileClick(e) {
    e.preventDefault();
    const idx = e.currentTarget.name
    this.props.getPins(idx).then(() => {
      this.setState({modalIsOpen: true, focusedPinId: idx})
    });
    document.body.style.overflow = "hidden";
  }

  pinTileRender(){
  return(
    this.props.board.pins.map( (tile, idx) => {
      return(
        <div key={idx} className="pin-tile">
          <button name={tile.id} onClick={(e) => this.handleTileClick(e)}>
            <img src={tile.thumb_img_url}/>
          </button>
        </div>
      )
    })
  )
}

}
