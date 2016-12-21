
// write String.prototype.mySlice. It should take a start index and an
// (optional) end index.

String.prototype.mySlice = function(start, end){
  if (end === undefined || this.length < end){
    end = this.length;
  }
  let newArr = [];
  for (let i = start; i < end; i++){
    newArr.push(this[i])
  }
  return newArr.join("")
}

// write Array.prototype.myReduce (analogous to Ruby's Array#inject).
Array.prototype.myReduce = function(callback){
  acc = this[0]
  for (let i = 1; i < this.length; i++){
    acc = callback(acc, this[i])
  }
  return acc
}
// [1,3].myReduce((accum, el) => accum + el)
// write Array.prototype.quickSort(comparator). Here's a quick refresher if
// you've forgotten how quickSort works:
//   - choose a pivot element from the array (usually the first)
//   - for each remaining element of the array:
//     - if the element is less than the pivot, put it in the left half of the
//     array.
//     - otherwise, put it in the right half of the array.
//   - recursively call quickSort on the left and right halves, and return the
//   full sorted array.

// write myFind(array, callback). It should return the first element for which
// callback returns true, or undefined if none is found.
Array.prototype.quickSort = function(comparator){
  if (this.length <= 1){
    return this
  }

  if (comparator === undefined){
    function comparator(piv, el){
      if (piv < el){
        return -1
      } else if (piv === el){
        return 0
      } else {
        return 1
      }
    }
  }
  let pivot = this[0]
  let leftArr = [];
  let rightArr = [];
  for (let i = 1; i < this.length; i++){
    let test = comparator(pivot, this[i])
    if (test === 1){
      leftArr.push(this[i])
    } else {
      rightArr.push(this[i])
    }
  }
  return leftArr.quickSort(comparator).concat([pivot]).concat(rightArr.quickSort(comparator))
}
// [5, 4, 3, 3, 2, 1].quickSort()
function myFind(array, callback){
  for (let i = 0; i < array.length; i++){
    if (callback(array[i])){
      return array[i]
    }
  }
  return undefined
}
// write sumNPrimes(n)

function sumNPrimes(n){
  let counter = 0
  let sum = 0
  for (let i = 2; counter < n; i++){
    if (isPrime(i)){
      sum += i
      counter += 1
    }
  }
  return sum
}

function isPrime(num){
  if (num === 2){
    return true
  }

  for (let i = 2; i < num; i++){
    if (num % i === 0){
      return false
    }
  }
  return true
}
// write
Function.prototype.myBind = function(ctx, ...callArgs){
  return (...backArgs) => this.apply(ctx, callArgs.concat(backArgs))
}

// write
Function.prototype.inherits = function(parent){
  function Surrogate(){}
  Surrogate.prototype = parent.prototype
  this.prototype = new Surrogate()
  this.prototype.constructor = this
}
// class Cat {
//   constructor (name) {
//     this.name = name;
//   }
//
//   sayHello () {
//     return this.name + " says hello!";
//   }
// }
//   sally = new Cat("Sally");
//   markov = new Cat("Markov");
//   curie = new Cat("Curie");
//   sally.sayHello.myBind(sally)()
