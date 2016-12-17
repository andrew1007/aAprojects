const GameView = require('./game_view.js');

document.addEventListener("DOMContentLoaded", function(){
  let canvasElement = document.getElementById("game-canvas");
  const ctx = canvasElement.getContext("2d");
  let gameView = new GameView(ctx);
  gameView.start();
});
