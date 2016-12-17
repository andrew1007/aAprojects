function addSum(){
  let nums = Array.prototype.slice.call(arguments);
  let sums = 0;
  nums.forEach(function(el){
    sums += el;
  });
  return sums;
}

// console.log(sum(1,3,24,2,4));
function sumTwo(...nums){
  let sums = 0;
  nums.forEach(function(el){
    sums += el;
  });
  return sums;
}
// console.log(sumTwo(1,3,24,2,4));

Function.prototype.myBind = function(){
  let val = Array.prototype.slice.call(arguments);
  return (...newVal) => this.apply(val[0], val.splice(1).concat(newVal));
};

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

// const markov = new Cat("Markov");
// const breakfast = new Cat("Breakfast");
//
// markov.says("meow", "Ned");
// markov.says.myBind(breakfast, "meow", "Kush")();
// markov.says.myBind(breakfast)("meow", "a tree");
// markov.says.myBind(breakfast, "meow")("Markov");
//
// const notMarkovSays = markov.says.myBind(breakfast);
// notMarkovSays("meow", "me");


function curriedSum(numVals){
  let numbers = [];
  let _curriedSum = function(num){
    numbers.push(num);
    if (numbers.length === numVals){
      return addSum(...numbers);
    } else {
      return _curriedSum;
    }
  };
  return _curriedSum;
}

// const sum = curriedSum(4);
// console.log(sum);
// console.log(sum(5)(30)(20)(1)); // => 56


Function.prototype.curry = function(numArgs){
  let newArr = [];
  let that = this;
  let curried = function(val){
    newArr.push(val);
    if (newArr.length === numArgs){
      return that(...newArr);
    } else{
      return curried;
    }
  };
  return curried;
};

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

// console.log(sumThree.curry(3)(4)(20)(6));
