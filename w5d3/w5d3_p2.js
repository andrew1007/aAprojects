function printCallback(array){
  array.forEach(function(i){
    console.log(i);
  })
}

function titleize(array, callback){
  var arr = array.map(function(i){
    return `Mx. ${i} Jingleheimer Schmidt`;
  })
  callback(arr);
}
// console.log(titleize(["Mary", "Brian", "Leo"], printCallback));

function Elephant(name, height, tricks){
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function(){
  console.log(`${this.name} the elephant goes 'phrRRR!'`);
}

Elephant.prototype.grow = function(){
  this.height += 12;
}

Elephant.prototype.addTrick = function(trick){
  this.tricks.push(trick);
}

Elephant.prototype.play = function(){
  console.log(this.tricks[Math.floor(Math.random()*(this.tricks.length - 1))]);
}

Elephant.prototype.paradeHelper = function(herd){
  console.log(`${herd.name} is trotting by!`);
}
// var ele = new Elephant()
// console.log(Elephant);
// console.log(ele.play());

// let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
// let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
// let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
// let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);
//
// let herd = [ellie, charlie, kate, micah];
// micah.paradeHelper(micah);

function dinerBreakfast(new_order){
  this.order = "I'd like cheesy scrambled eggs please";
  var x = function({
    return this.order + new_order;
  })
  console.log(order);
}
bfastOrder = dinerBreakfast()
console.log(bfastOrder("asdfsd"))
