import {RECEIVE_ALL_POKEMON} from '../actions/pokemon_actions';

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      return action.pokemon;
    default:
      console.log("hit default");
      return state;
  }
};

export default pokemonReducer;
