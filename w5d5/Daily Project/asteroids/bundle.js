/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const GameView = __webpack_require__(1);

	document.addEventListener("DOMContentLoaded", function(){
	  let canvasElement = document.getElementById("game-canvas");
	  const ctx = canvasElement.getContext("2d");
	  let gameView = new GameView(ctx);
	  gameView.start();
	});


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	const Game = __webpack_require__(2);
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


/***/ },
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	const Asteroid = __webpack_require__(3);
	const Bullet = __webpack_require__(6);
	const Ship = __webpack_require__(7);

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


/***/ },
/* 3 */
/***/ function(module, exports, __webpack_require__) {

	const Util = __webpack_require__(4);
	const MovingObject = __webpack_require__(5);
	function Asteroid(pos){
	  const vals = {pos: pos,
	    vel: Util.randomVec(5),
	    radius: 4,
	    color: "#00FF00"
	  };
	  MovingObject.call(this, vals);
	  
	}
	Util.inherits(Asteroid, MovingObject);

	module.exports = Asteroid;


/***/ },
/* 4 */
/***/ function(module, exports) {

	const Util = {
	  inherits (child, parent) {
	    let Surrogate = function(){};
	    Surrogate.prototype = parent.prototype;
	    child.prototype = new Surrogate();
	    child.prototype.constructor = child;
	  },
	  randomVec (length) {
	    const deg = 2 * Math.PI * Math.random();
	    return this.scale([Math.sin(deg), Math.cos(deg)], length);
	  },
	  // Scale the length of a vector by the given amount.
	  scale (vec, m) {
	    return [vec[0] * m, vec[1] * m];
	  }
	};



	module.exports = Util;


/***/ },
/* 5 */
/***/ function(module, exports, __webpack_require__) {

	const Util = __webpack_require__(4);
	function MovingObject(vals){
	  this.pos = vals.pos;
	  this.vel = vals.vel;
	  this.radius = vals.radius;
	  this.color = vals.color;
	}

	MovingObject.prototype.draw = function(ctx){
	  ctx.fillStyle = this.color;
	  ctx.beginPath();

	  ctx.arc(
	    this.pos[0],
	    this.pos[1],
	    this.radius,
	    0,
	    2 * Math.PI,
	    false
	  );

	  ctx.fill();
	};

	MovingObject.prototype.move = function(){
	  this.pos[0] += this.vel[0];
	  this.pos[1] += this.vel[1];
	};


	module.exports = MovingObject;


/***/ },
/* 6 */
/***/ function(module, exports, __webpack_require__) {

	const MovingObject = __webpack_require__(5);
	function Bullet(){

	}

	module.exports = Bullet;


/***/ },
/* 7 */
/***/ function(module, exports, __webpack_require__) {

	const MovingObject = __webpack_require__(5);
	function Ship(){

	}

	module.exports = Ship;


/***/ }
/******/ ]);