function Router(node){
  this.node = node
}

Router.prototype.start = function(){
  this.render()
  document.addEventListener('hashchange',() => {
    this.render()
  })
}

Router.prototype.render = function(){
  this.node.innerHTML = ""
  let url = this.activeRoute()
  this.node.appendChild(url.render())
}

Router.prototype.activeRoute = function () {
  let hashFrag = window.location.hash
  hashFrag = hashFrag.replace("#", "")
  let component = this.routes[hashFrag]
  return component
};
module.exports = Router
