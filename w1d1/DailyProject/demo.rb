require 'byebug'
# display_demo.rb
(1..100).each do |num|
  debugger
  square = num ** 2
  half = num / 0
  debugger
end

def sum(arr)
  return arr.first if arr.length == 1
  arr.first + sum(arr[1..-1])
end

def expo(base, exp)
  return 1 if exp == 0
  base * expo(base, exp - 1)
end


def fibbn(n)
  fibb ||= [1, 1]
  return fibb if fibb.length == n #?
  fibb = fibbn(n - 1)
  fibb << fibb[-1] + fibb[-2]
end

def fact(n)
  return 1 if n == 1
  n * fact(n - 1)
end

def quicksort(arr)
  pivot = [arr.first]
  return arr if arr.length <= 1
  left = arr[1..-1].select { |i| i <= arr.first}
  right = arr[1..-1].select { |i| i > arr.first}
  quicksort(left) + pivot + quicksort(right)
end
quicksort([6,4,1,3,4,10,5,11,13])

def findmin(arr)
  num = arr.first
  return num if arr.length == 0
  tested = findmin(arr[1..-1])
  num = (num > tested) ? num : findmin[1..-1]
  num
end

findmin([6,4,1,3,4,10,5,11])

def sum(arr)
  return arr.first if arr.length <= 1
  arr.first + sum(arr[1..-1])
end
sum([1,4,2,5,6])

def binary_search(arr, tar, low = 0, high = nil)
  high = arr.length - 1 if high.nil?
  idx = (low + high) / 2
  return "not found" if low > high
  case arr[idx] <=> tar
  when 1
    binary_search(arr, tar, low, idx - 1)
  when -1
    binary_search(arr, tar, idx + 1, high)
  else
    idx
  end
end

binary_search([0,1,4,5,6,7,8,9,12,26,45,67,78,90,98,123,211,234,456,769,865,2345,3215,14345,24324], 10)

def quicksort(arr)
  pivot = arr.first
  return arr if arr.length <= 1
  left = arr[1..-1].select { |i| i < pivot }
  right = arr[1..-1].select { |i| i >= pivot}
  quicksort(left) + [pivot] + quicksort(right)
end

quicksort([0,1,4,5,6,7,8,9,12,26,45,67,78,90,98,123,211,234,456,769,865,2345,3215,14345,24324, 1])


def binary_search(target, low = 0, high = nil)
  high = self.length - 1 if high.nil?
  mid_idx = (low + high) / 2
  return nil if low > high
  case self[mid_idx] <=> target
  when 0 then return mid_idx
  when -1 then self.binary_search(target, low = mid_idx + 1, high = high)
  when 1 then self.binary_search(target, low = 0, high = mid_idx - 1)
  end
end
x= [0,1,4,5,6,7,8,9,12,26,45,67,78,90,98,123,211,234,456,769,865,2345,3215,14345,24324]
x.binary_search(100)


def quicksort
  pivot = self.first
  return self if self.length <= 1
  left_select = self[1..-1].select { |i| i < pivot}
  right_select = self[1..-1].select { |i| i >= pivot}
  left_select.quicksort + [pivot] + right_select.quicksort
end

y =[6,4,1,3,4,10,5,11,13]
y.quicksort

def fizzbuzz
  (1..100).each do |num|
    case
    when num % 3 == 0 && num % 5 == 0 then puts "fizzbuzz"
    when num % 3 == 0 then puts "fizz"
    when num % 5 == 0 then puts "buzz"
    end
  end
end
fizzbuzz
