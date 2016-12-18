function fizzBuzz(arr){
  let newArr = [];
  for (let i = 0; i < arr.length; i++){
    if ((arr[i] % 3 == 0 || arr[i] % 5 == 0) && !(arr[i] % 3 == 0 && arr[i] % 5 == 0)){
      newArr.push(arr[i]);
    }
  }
  return newArr;
}
// fizzBuzz([1,3,4,6,57,8,87,3,42,15]);

function isPrime(n){
  if (n === 2){
    return true;
  }
  for (let i = 2; i < n; i ++){
    if (n % i === 0){
      return false;
    }
  }
  return true;
}

// isPrime(3);
// isPrime(10);
// isPrime(13);
// isPrime(15485863)

function sumOfPrimes(n){
  let sum = 0;
  let counter = 0;
  for (let i = 2; true; i++){
    if (counter === n){
      return sum
    }
    if (isPrime(i)){
      sum += i;
      counter += 1;
    }
  }
}
// sumOfPrimes(4);
// sumOfPrimes(0);
// sumOfPrimes(1);

function titleize(arr, callback){
  let title = arr.map( function(el){
    return `Mx. ${el} Jingleheimer Schmidt`
  });
  callback(title)
};

function printCallback(arr){
  arr.forEach(function(i){
    console.log(i);
  });
};

// titleize(["Mary", "Brian", "Leo"], printCallback);
// Math.floor(Math.random()*10)
function dinerBreakfast(foodOrder){
  let start = "I'd like cheesy scrambled eggs please";
  console.log(start);

  return function(food){
    start = start + "and" + food + "please";
    console.log(start);
  }
}
const bastOrder = dinerBreakfast();
bastOrder("Asdf");

Array.prototype.uniq = function(){
  let newArr = [];
  for(let i = 0; i < this.length; i++){
    if (!newArr.includes(this[i])){
      newArr.push(this[i])
    }
  }
  return newArr;
}
// [1,1,1,1,1,2].uniq()

Array.prototype.twoSum = function(){
  let newArr = [];
  for (let i =0; i < this.length - 1; i++){
    for (let j = i + 1; j< this.length; j ++){
      if (this[i] + this[j] === 0){
        newArr.push([i, j]);
      }
    }
  }
  return newArr;
};
[-1, 0, 2, -2, 1].twoSum();

Array.prototype.transpose = function(){
  let newArr = [];
  for (let i = 0; i < this.length; i++){
    let subArr = [];
    for (let j = 0; j < this.length; j++){
      subArr.push(this[j][i]);
    }
    newArr.push(subArr);
  }
  return newArr;
};
// [[0, 1, 2], [3, 4, 5], [6, 7, 8]].transpose();

Array.prototype.myEach = function(callback){
  for(let i = 0; i < this.length; i++){
    callback(this[i])
  }
};
// [1,1,3].myEach(i => console.log(i + 1));

Array.prototype.myMap = function(callback){
  let newArr = [];
  for(let i = 0; i < this.length; i++){
    newArr.push(callback(this[i]));
  }
  return newArr;
}
[1,1,3].myMap(i => i + 1);

Array.prototype.myInject = function(callback){
  let start = this[0];
  for(let i = 1; i < this.length; i++){
    start = callback(start, this[i])
  }
  return start
}
// [1,1,1,1,3,4].myInject(function(i, j){
//   return i + j;
// });


Array.prototype.bubbleSort = function(){
  for (let i = 0; i < this.length; i++){
    if (this[i] > this[i + 1]){
      let first = this[i];
      let second = this[i + 1];
      this[i] = second;
      this[i + 1] = first;
      i = 0
    }
  }
  return this
};
// [1,31,4,35,1,32,3,53,1].bubbleSort();

function subString(str){
  let newArr = [];
  for (let i = 0; i < str.length; i++){
    let substr = "";
    for(let j = i; j < str.length; j++){
      substr = substr + str[j];
      newArr.push(substr);
    }
  }
  return newArr;
}
// subString("asd");

Array.prototype.ridx = function(n){
  return this[this.length + n];
};

function range(start, end){
  if (start === end){
    return [start];
  }

  return range(start,end-1).concat(range(start, end - 1).last() + 1);
}

// console.log(range(1, 5));
function fibb(n){
  if (n == 2){
    return [1, 1];
  }
  new_fibb = fibb(n - 1);
  return new_fibb.concat(new_fibb.ridx(-1) + new_fibb.ridx(-2));
}
// fibb(10);

function factorial(n){
  if(n === 0){
    return [1];
  }
  fact = factorial(n - 1);
  return fact.concat(n * fact.ridx(-1));
}
factorial(2);

function sumTo(arr, n){
  if (n === 0){
    return arr[0]
  }
  return (arr[n] + sumTo(arr, n - 1))
}

function sum(n){
  if (n === 1){
    return n;
  }
  return sum(n - 1) + n;
}

sum(3);
sum(4);

function minEl(arr, size){
  if (size === undefined){
    size = arr.length
  }
  if (size === 1){
    return arr[0];
  }
  if (arr[0] < arr[size - 1]){
    arr[0] = arr[size - 1];
  }
  return minEl(arr, size - 1)
}

minEl([4,34,5]);

function arrSum(arr, size){
  if (size === undefined){
    size = arr.length;
  }
  if (size === 1){
    return arr[0]
  }
  arr[0] = arr[0]+ arr[size - 1]
  return arrSum(arr, size - 1)
}
arrSum([1,4,5,13])

function palindrome(arr, size){
  if (size === undefined){
    size = arr.length;
  }
  if (arr.length <= 1){
    return true;
  }
  if (arr[0] !== arr[size - 1]){
    return false;
  }
  return palindrome(arr.slice(1, size - 1), arr.slice(1,size-1).length);
}

function deepDup(arr){
  let newArr = [];
  for (let i = 0; i < arr.length; i++){
    if (arr[i].constructor === Array){
      newArr.push(deepDup(arr[i]));
    } else {
      newArr.push(arr[i]);
    }
  }
  return newArr;
}
deepDup([[1,3,4],3,[1]])

function factorial(n){
  if (n <= 1){
    return 1
  }
  return n * factorial(n - 1)
}
factorial(3)

function factoarr(n){
  if (n === 1){
    return [1, 1]
  }
  return factoarr(n - 1).concat(factoarr(n - 1).ridx(-1) * (n))
  // return arr.slice(0, arr.length)
}
factoarr(5)

function sum(arr){
  if (arr.length <= 1){
    return arr[0]
  }
  size = arr.length
  arr[0] = arr[0] + arr[size - 1]
  return sum(arr.slice(0, size - 1))
}
sum([1,3,10])

Array.prototype.mySelect = function(callback){
  let newArr = [];
  for (let i = 0; i < this.length; i++){
    if (callback(this[i])){
      newArr.push(this[i]);
    }
  }
  return newArr
}

[1,3,4,51,1].mySelect(i => i > 2)
