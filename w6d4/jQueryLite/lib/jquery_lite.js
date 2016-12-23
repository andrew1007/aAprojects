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

	const DOMNodeCollection = __webpack_require__(1);

	function $l(HTMLElement) {
	  let nodeList = document.querySelectorAll(HTMLElement);
	  let array_obj = Array.prototype.slice.call(nodeList);
	  // if (typeof(selector) === 'string') {
	    return new DOMNodeCollection(array_obj);
	  // } else {
	  //   return array_obj;
	  // }
	};


	window.$l = $l


/***/ },
/* 1 */
/***/ function(module, exports) {

	class DOMNodeCollection{
	  constructor(selector){
	    this.nodes = selector;
	  }

	  html(html) {
	    if (typeof html === "string") {
	      this.nodes.forEach(node => node.innerHTML = html);
	    } else {
	      if (this.nodes.length > 0) {
	        return this.nodes[0].innerHTML;
	      }
	    }
	  }

	  empty() {
	    this.nodes = "";
	  }

	  append(obj) {
	    if (obj instanceof DOMNodeCollection){
	      this.nodes.forEach(node => {
	        obj.nodes.forEach(childNode => {
	          node.appendChild(childNode.cloneNode(true));
	        });
	      });
	    } else if (typeof obj === 'string'){
	      this.nodes.forEach(node => node.innerHTML += obj);
	    } else {
	      obj = $l(obj)
	    }
	  }

	  attr(key, val){
	    if (val === undefined){
	      return this.nodes[0].getAttribute(key);
	    } else {
	      this.nodes.forEach(node => {
	        node.setAttribute(key, val)
	      });
	    }
	  }

	  addClass(val) {
	    this.nodes.forEach(node => {
	      let currentClass = node.getAttribute("class");
	      if (currentClass === null){
	        currentClass = ""
	      } else {
	        currentClass += " "
	      }
	      node.setAttribute("class", `${currentClass}${val}`)
	    });
	  }

	  removeClass(val) {
	    this.nodes.forEach(node => {
	      let currentClass = node.getAttribute("class");
	      if (currentClass === null){
	        return;
	      } else if (!currentClass.includes(val)){
	        return;
	      } else {
	        node.setAttribute("class", `${currentClass.replace(` ${val}`, "")}`)
	        if (node.getAttribute("class") === val){
	          let currentClass = node.getAttribute("class");
	          node.setAttribute("class", `${currentClass.replace(`${val}`, "")}`)
	        }
	      }
	    });
	  }
	}
	  //
	  // empty(){
	  //   this.innerHTML = ""
	  // }
	  //
	  // append(obj){
	  //   this.outerHTML.forEach((el) => {
	  //     el.concat(obj)
	  //   });
	  // }
	  //
	  // attr(attribute){
	  //   let newArr = [];
	  //   this.outerHTML.forEach((el)){
	  //
	  //   }
	  // }


	module.exports = DOMNodeCollection


/***/ }
/******/ ]);