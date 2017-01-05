import React from 'react';
import { PokemonIndexItem } from './pokemon_index_item'

export default class PokemonIndex extends React.Component{
  constructor(props){
    // debugger;
    super(props);
    // this.pokemon = this.props.pokemon;
  }

  componentDidMount(){
    this.props.requestAllPokemon();
  }

  render(){
    return(PokemonIndexItem(this.props.pokemon))
  }
}
