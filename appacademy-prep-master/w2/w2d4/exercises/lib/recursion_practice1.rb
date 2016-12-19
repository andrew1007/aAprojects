def quicksort(arr)
  return arr if arr.length <= 1
  pivot = arr.first
  left = arr.select { |num| num < pivot }
  right = arr.select { |num| num > pivot }
  quicksort(left) + [pivot] + quicksort(right)
end

quicksort((1..30).to_a.shuffle)

def merge_sort(arr)
  return arr if arr.length <= 1
  mid = arr.length / 2
  left = merge_sort(arr[0...mid])
  right = merge_sort(arr[mid..-1])
  merge(left, right)
end

def merge(left, right)
  new_arr = []
  until left.empty? || right.empty?
    new_arr << (left.first < right.first ? left.shift : right.shift)
  end
  new_arr + left + right
end

merge_sort((1..30).to_a.shuffle)

def binary_search(arr, target, low, high)
  
end
