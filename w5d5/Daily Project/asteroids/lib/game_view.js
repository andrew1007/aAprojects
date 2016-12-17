const Game = require('./game.js');
function GameView(ctx){
  this.game = new Game(600, 800, 100);
  this.ctx = ctx;
}

GameView.prototype.start = function(){
  window.setInterval( () => {
    this.game.moveObjects();
    this.game.draw(this.ctx);
  }, 100);

};


module.exports = GameView;
