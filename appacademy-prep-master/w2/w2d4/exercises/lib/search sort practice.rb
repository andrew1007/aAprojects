def mergesort(arr)
  return arr if arr.length <= 1
  mid = arr.length / 2
  left = mergesort(arr[0...mid])
  right = mergesort(arr[mid..-1])
  merge(left, right)
end

def merge(left, right)
  new_arr = []
  until left.empty? || right.empty?
    new_arr << (left.first < right.first ? left.shift : right.shift)
  end
  new_arr + left + right
end

mergesort((1..10).to_a.shuffle)


def binary_search(arr, val, low = 0, high = nil)
  high = arr.length - 1 if high.nil?
  return nil if low > high
  mid = (low + high) / 2
  case val <=> arr[mid]
  when 1
    binary_search(arr, val, low = mid + 1, high)
  when -1
    binary_search(arr, val, low, high = mid - 1)
  when 0 then return mid
  end
end

binary_search((1..10).to_a, 11)

def quicksort(arr)
  return arr if arr.length <= 1
  pivot = arr.first
  left = arr.select { |num| num < pivot }
  right = arr.select { |num| num >= pivot}
  left + [pivot] + right
end

quicksort((1..10).to_a + (10..15).to_a)
