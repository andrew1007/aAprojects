import React from 'react';
import { Link } from 'react-router';

export const PokemonIndexItem = pokemonArray => {
  let pokemonList = pokemonArray.map((pokemon) => (
    <li key={pokemon.id}>
      <Link to={"/pokemon/" + pokemon.id}>
        {pokemon.name}
        <img src={pokemon.image_url}/>
      </Link>
    </li>
  ));
  return(
    <ul>
      {pokemonList}
    </ul>
  );
}
