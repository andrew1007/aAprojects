const DOMNodeCollection = require("./dom_node_collection.js");

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
