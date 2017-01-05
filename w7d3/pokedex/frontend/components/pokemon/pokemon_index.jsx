import React from 'react';

export default class PokemonIndex extends React.Component{
  constructor(props){
    super(props);
    // this.pokemon = this.props.pokemon;
  }

  componentDidMount(){
    this.props.requestAllPokemon();
  }

  render(){
    let pokemonList = this.props.pokemon.map((pokemon) => (
      <li key={pokemon.id}>{pokemon.name}</li>
    ));
    return(
      <ul>
        {pokemonList}
      </ul>
    );
  }
}
