const View = require('./hanoi-view.js');// require appropriate file
const Game = require('./game.js');// require appropriate file

$( () => {
  const game = new Game();
  const rootEl = $('.hanoi');
  new View(game, rootEl);
});
