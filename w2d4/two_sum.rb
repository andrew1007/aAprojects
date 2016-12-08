def two_sum_brute?(arr, target)
  arr.length.times do |i|
    arr.length.times do |j|
      next if i == j
      return true if arr[i] + arr[j] == target
    end
  end
  false
end
arr = [0, 1, 5, 7]
two_sum_brute?(arr, 6) # => should be true
two_sum_brute?(arr, 10) #

def two_sum_sort?(arr, target)
  sorted_arr = arr.sort
  while sorted_arr.length > 1
    curr_f, curr_e = sorted_arr.first, sorted_arr.last
    sum = curr_f + curr_e
    case sum <=> target
    when 1 then sorted_arr.pop
    when 0 then return true
    when -1 then sorted_arr.shift
    end
  end
  false
end
arr = [0, 1, 5, 7]
two_sum_sort?(arr, 6) # => should be true
two_sum_sort?(arr, 10) #

def hash_two_sum?(arr, target)
  hash = {}
  arr.each do |el|
    return true if hash[(target - el)]
    hash[el] = true
  end
  false
end

arr = [0, 1, 5, 7]
hash_two_sum?(arr, 6) # => should be true
hash_two_sum?(arr, 10) #
