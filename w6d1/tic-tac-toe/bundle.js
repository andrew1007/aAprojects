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

	const View = __webpack_require__(1);// require appropriate file
	const Game = __webpack_require__(2);// require appropriate file

	$( () => {
	  const game = new Game();
	  const rootEl = $('.hanoi');
	  new View(game, rootEl);
	});


/***/ },
/* 1 */
/***/ function(module, exports) {

	Array.prototype.last = function(){
	  return this[this.length - 1];
	};

	class View {
	  constructor(game, $el) {
	    this.$el = $el;
	    this.game = game;
	    this.setUpTowers();
	    this.clickTower();
	    this.firstSelect = undefined;
	    this.secondSelect = undefined;
	  }

	  render() {

	  }

	  clickTower(){
	    $(".pile").on("click", (e)=>{
	      let $currPile = $(e.currentTarget);
	      let currPile = $currPile;
	      if (this.firstSelect === undefined){
	        currPile.addClass("selected");
	        this.firstSelect = parseInt(currPile.attr("pileIdx"));
	      } else {
	        this.secondSelect = parseInt(currPile.attr("pileIdx"));
	        if (this.game.move(this.firstSelect, this.secondSelect)){
	          let pile = this.$el.find(`[pileIdx=${this.secondSelect}]`);
	          let discNum = this.game.towers[this.secondSelect].last();
	          pile.append($("<li>").addClass(`disc-${discNum}`).attr("disc", discNum));
	          let removePile = this.$el.find(`[pileIdx=${this.firstSelect}]`);
	          removePile.find(`[disc=${discNum}]`).remove();
	        } else {
	          alert("invalid move");
	        }

	        this.resetSelections();
	      }
	    });

	  }

	  resetSelections(){
	    this.$el.find(".selected").removeClass("selected");
	    this.firstSelect = undefined;
	    this.secondSelect = undefined;
	  }

	  setUpTowers() {
	    const $pile0 = $("<ul>").addClass("pile").addClass("group").attr("pileIdx", 0);
	    for (let discSize = 1; discSize <= 3; discSize++){
	      const $discs = $("<li>").addClass(`disc-${discSize}`).attr("disc", discSize);
	      $pile0.append($discs);
	    }
	    this.$el.append($pile0);
	    const $pile1 = $("<ul>").addClass("pile").addClass("group").attr("pileIdx", 1);
	    const $pile2 = $("<ul>").addClass("pile").addClass("group").attr("pileIdx", 2);
	    this.$el.append($pile1);
	    this.$el.append($pile2);
	  }

	}

	module.exports = View;


/***/ },
/* 2 */
/***/ function(module, exports) {

	class Game {
	  constructor() {
	    this.towers = [[3, 2, 1], [], []];
	  }

	  isValidMove(startTowerIdx, endTowerIdx) {
	      const startTower = this.towers[startTowerIdx];
	      const endTower = this.towers[endTowerIdx];

	      if (startTower.length === 0) {
	        return false;
	      } else if (endTower.length == 0) {
	        return true;
	      } else {
	        const topStartDisc = startTower[startTower.length - 1];
	        const topEndDisc = endTower[endTower.length - 1];
	        return topStartDisc < topEndDisc;
	      }
	  }

	  isWon() {
	      // move all the discs to the last or second tower
	      return (this.towers[2].length == 3) || (this.towers[1].length == 3);
	  }

	  move(startTowerIdx, endTowerIdx) {
	      if (this.isValidMove(startTowerIdx, endTowerIdx)) {
	        this.towers[endTowerIdx].push(this.towers[startTowerIdx].pop());
	        return true;
	      } else {
	        return false;
	      }
	  }

	  print() {
	      console.log(JSON.stringify(this.towers));
	  }

	  promptMove(reader, callback) {
	      this.print();
	      reader.question("Enter a starting tower: ", start => {
	        const startTowerIdx = parseInt(start);
	        reader.question("Enter an ending tower: ", end => {
	          const endTowerIdx = parseInt(end);
	          callback(startTowerIdx, endTowerIdx);
	        });
	      });
	  }

	  run(reader, gameCompletionCallback) {
	      this.promptMove(reader, (startTowerIdx, endTowerIdx) => {
	        if (!this.move(startTowerIdx, endTowerIdx)) {
	          console.log("Invalid move!");
	        }

	        if (!this.isWon()) {
	          // Continue to play!
	          this.run(reader, gameCompletionCallback);
	        } else {
	          this.print();
	          console.log("You win!");
	          gameCompletionCallback();
	        }
	      });
	  }
	}

	module.exports = Game;


/***/ }
/******/ ]);