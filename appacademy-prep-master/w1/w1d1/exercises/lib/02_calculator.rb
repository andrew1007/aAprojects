#addition
def add(num1 = 0, num2 = [])
  return num1 + num2
end

#subtraction
def subtract(num1, num2)
  return num1 - num2
end

#summation
def sum(arr)
  return [0, arr].flatten.reduce(:+)
end

#multiplication
def multiply(arr)
  return arr.reduce(:*)
end

#power raising
def power(arr)
  return arr[0]**arr[1]
end

#factorial
def factorial(num)
  if num == 0
    return 1
  end
  arr = (1..num).to_a
  computed = arr.reduce(:*)
  return computed
end
