function array(arr){
  let newArray = [];
  arr.forEach(
    function(el){
      if (newArray.includes(el) === false){
        newArray.push(el);
      }
    });
  return newArray;
}

// console.log(array([1,2,3,1,1,1]));
// don't need this, but it's proofing.

Array.prototype.twoSum = function(){
  let newArray = [];

  for(let i = 0; i < this.array.length; i++){
    for(let j = i + 1; j < this.array.length; j++){
      if (this.array[i] + this.array[j] === 0){
        newArray.push([i, j]);
      }
    }
  }
  return newArray;
};


// var testArray = new Array([-1, 0, 2, -2, 1]);
// console.log(testArray.twoSum());

function myTranspose(arr){
  let newArray = [];
  for (let i = 0; i < arr.length; i++){
    let subArray = [];
    for(let j = 0; j < arr[0].length; j++){
      subArray.push(arr[j][i]);
    }
    newArray.push(subArray);
  }
  return newArray;
}

// console.log(myTranspose([
//     [0, 1, 2],
//     [3, 4, 5],
//     [6, 7, 8]
//   ]));


Array.prototype.myEach = function(block) {
  for (let i = 0; i < this.length; i++ ) {
    block(this[i]);
  }
  return this;
};

Array.prototype.myMap = function(block) {
  let newArray = [];
  this.myEach( function(i) {
    newArray.push(block(i));
  });
  return newArray;
};

[1,2,3,4].myMap(function(i) {return i * 2;});

Array.prototype.myInject = (block) => {
  let accumulator = this[0];
  this.slice(1).myEach( (el) => {
      accumulator = block(accumulator, el);
    }
  );
  return accumulator;
};

Array.prototype.bubbleSort = function(block) {
  for (let i = 0; i < this.length - 1; i++){
    let n1 = this[i];
    let n2 = this[i + 1];
    if (n1 > n2){
      this[i] = n2;
      this[i + 1] = n1;
      i = 0;
    }
  }
  return this;
};

function subStrings(word){
  let newArray = [];
  for (let i = 0; i < word.length; i++){
    for (let j = i + 1; j < word.length + 1; j++){
      newArray.push(word.slice(i, j));
    }
  }
  return newArray;
}
// subStrings("asdf");

Array.prototype.last = function(){
  let arrLength = this.length - 1;
  return this[arrLength];
};

Array.prototype.rindex = function(idx){
  let arrLength = this.length;
  return this[arrLength + idx];
};

Array.prototype.take = function(count){
  let arr = [];
  for (let i = 0; i < count; i++){
    arr.push(this[i]);
  }
  return arr;
};

Array.prototype.drop = function(count){
  for (let i = 0; i < count; i++){
    this.shift();
  }
  return this;
};

function range(start, end){
  // let newArray = [];
  if (end < start){
    return [];
  }
  return range(start, end - 1).concat([end]);
}
range(1,5);

function fibonacci(n){
  if (n === 2 ) {
    return [1, 1];
  }
  let fib = fibonacci(n-1);
  return fib.concat(fib.rindex(-1) + fib.rindex(-2));
}


function bsearch(arr, number, low = 0, high) {
  if (high === undefined) {
    high = arr.length - 1;
  }
  if (low > high){
    return null;
  }
  let mid = Math.floor((low + high) / 2);
  if (arr[mid] === number ){
    return mid;
  } else if (arr[mid] > number){
    return bsearch(arr, number, low, mid - 1);
  } else {
    return bsearch(arr, number, mid + 1, high);
  }
}

function mergeSort(arr){
  if (arr.length === 1){
    return arr;
  }
  let mid = Math.floor(arr.length / 2);
  let leftArr = arr.take(mid);
  let rightArr = arr.drop(mid);
  return merge(mergeSort(leftArr), mergeSort(rightArr));
}

function merge(left, right){
  let newArray = [];
  while (left.length !== 0 || right.length !== 0 ){
    if (left.length === 0 || right.length === 0){
      break;
    }
    else if (left[0] > right[0]){
      newArray.push(right.shift());
    } else {
      newArray.push(left.shift());
    }
  }
  return newArray.concat(left).concat(right);
}


function makeChange(target, arr){
  if (arr.length === 0){
    return [];
  }

  let coinsHolder = [];
  while (arr[0] <= target){
    target = target - arr[0];
    coinsHolder.push(arr[0]);
  }
  return coinsHolder.concat(makeChange(target, arr.drop(1)));
}
console.log(makeChange(29, [10, 7, 1]));
