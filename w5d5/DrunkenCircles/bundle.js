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

	const Circle = __webpack_require__(1);

	const circles = [];

	window.Game = function (xDim, yDim) {
	  this.xDim = xDim;
	  this.yDim = yDim;

	  for (let i = 0; i < Game.NUM_CIRCLES; ++i) {
	    circles.push(
	      Circle.randomCircle(xDim, yDim, Game.NUM_CIRCLES)
	    );
	  }
	};

	Game.NUM_CIRCLES = 4000;

	Game.prototype.render = function (ctx) {
	  //this will empty the canvas
	  ctx.clearRect(0, 0, this.xDim, this.yDim);

	  circles.forEach(function (circle) {
	    circle.render(ctx);
	  });
	};

	Game.prototype.moveCircles = function () {
	  circles.forEach( circle => {
	    circle.moveRandom(this.xDim, this.yDim);
	  });
	};

	Game.prototype.start = function (canvasEl) {
	  // get a 2d canvas drawing context. The canvas API lets us call
	  // a `getContext` method on a canvas DOM element.
	  const ctx = canvasEl.getContext("2d");

	  //this function will update the position of all the circles,
	  //clear the canvas, and redraw them
	  const animateCallback = () => {
	    this.moveCircles();
	    this.render(ctx);
	    //this will call our animateCallback again, but only when the browser
	    //is ready, usually every 1/60th of a second
	    requestAnimationFrame(animateCallback);

	    //if we didn't know about requestAnimationFrame, we could use setTimeout
	    //setTimeout(animateCallback, 1000/60);
	  };

	  //this will cause the first render and start the endless triggering of
	  //the function using requestAnimationFrame
	  animateCallback();
	};

	module.exports = Game;


/***/ },
/* 1 */
/***/ function(module, exports) {

	const Circle =  function (centerX, centerY, radius, color) {
	  this.centerX = centerX;
	  this.centerY = centerY;
	  this.radius = radius;
	  this.color = color;
	};

	Circle.randomCircle = function (maxX, maxY, numCircles) {
	  return new Circle(
	    maxX * Math.random(),
	    maxY * Math.random(),
	    Circle.radius(maxX, maxY, numCircles),
	    Circle.randomColor()
	  );
	};

	const HEX_DIGITS = "0123456789ABCDEF";

	Circle.randomColor = function () {
	  let color = "#";
	  for (let i = 0; i < 6; i++) {
	    color += HEX_DIGITS[Math.floor((Math.random() * 16))];
	  }

	  return color;
	};

	Circle.radius = function (maxX, maxY, numCircles) {
	  let targetCircleArea = (maxX * maxY) / numCircles;
	  let targetRadius = Math.sqrt(targetCircleArea / Math.PI);
	  return 2 * targetRadius;
	};

	Circle.prototype.moveRandom = function (maxX, maxY) {
	  let dx = (Math.random() * 2) - 1;
	  let dy = (Math.random() * 2) - 1;

	  this.centerX = Math.abs((this.centerX + (dx * this.radius * 0.1)) % maxX);
	  this.centerY = Math.abs((this.centerY + (dy * this.radius) * 0.1) % maxY);
	};

	Circle.prototype.render = function (ctx) {
	  ctx.fillStyle = this.color;
	  ctx.beginPath();

	  ctx.arc(
	    this.centerX,
	    this.centerY,
	    this.radius,
	    0,
	    2 * Math.PI,
	    false
	  );

	  ctx.fill();
	};

	module.exports = Circle;


/***/ }
/******/ ]);