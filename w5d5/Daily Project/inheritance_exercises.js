Function.prototype.inherits = function(SuperClass){
  let Surrogate = function(){};
  Surrogate.prototype = SuperClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

//SuperClass
function MovingObject () {
  // this.print = function(){
  //   console.log('moving');
  // };
}

MovingObject.prototype.print = function(){
  console.log("dogs");
};

function Ship (name) {
  this.name = name;
}
Ship.inherits(MovingObject);

function Asteroid (name) {
  this.name = name;
}
Asteroid.inherits(MovingObject);

let ship = new Ship("dog");
console.log(ship.name);
ship.print();
