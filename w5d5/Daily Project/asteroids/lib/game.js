const Asteroid = require('./asteroid.js');
const Bullet = require('./bullet.js');
const Ship = require('./ships.js');

function Game(x, y, asteroidCount){
  this.DIM_X = x;
  this.DIM_Y = y;
  this.NUM_ASTEROIDS = asteroidCount;
  this.asteroidsArray = [];
  this.addAsteroids();
}

Game.prototype.addAsteroids = function() {
  for (let i = 0; i < this.NUM_ASTEROIDS; i ++) {
    this.asteroidsArray.push(new Asteroid([this.getRandomInt(this.DIM_X), this.getRandomInt(this.DIM_Y)]));
  }
};

Game.prototype.getRandomInt = function(max) {
  let min = Math.ceil(0);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max)) + min;
};


Game.prototype.draw = function(ctx){
  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);
  this.asteroidsArray.forEach(function(asteroid){
    asteroid.draw(ctx);
  });
};

Game.prototype.moveObjects = function(){
  this.asteroidsArray.forEach(function(asteroid){
    asteroid.move();
  });
};





module.exports = Game;
window.Game = Game;
