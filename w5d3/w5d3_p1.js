function madLib(verb, adj, noun){
  console.log(`We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}`)
}

function isSubstring(searchString, subString){
  console.log(searchString.includes(subString))
}

function isPrime(n){
  if (n === 1){
    return false;
  }

  for (var i = 2; i < n; i++ ){
    if (n % i === 0){
      return false;
    }
  }
  return true;
}
// console.log(isPrime(2));
// console.log(isPrime(10));
// console.log(isPrime(15485863));
// console.log(isPrime(3548563));

function sumOfNPrimes(n){
  var summer = 0;
  var counter = 0;
  var i = 2;
  while (true){
    if (counter === n){
      break
    }
    if (isPrime(i)){
      summer += i;
      counter += 1;
    }
    i += 1;
  }
  console.log(summer);
}
// console.log(sumOfNPrimes(0))
// console.log(sumOfNPrimes(1))
// console.log(sumOfNPrimes(4))

function allOrNothing(){
  const mod = arguments[0];
  for (var i = 1; i < arguments.length; i ++){
    if (arguments[i] % mod != 0){
      return false;
    }
  }
  return true;
}
// console.log(allOrNothing(3, 9, 12, 6))
// console.log(allOrNothing(5, 1, 2, 10))
