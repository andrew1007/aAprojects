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
