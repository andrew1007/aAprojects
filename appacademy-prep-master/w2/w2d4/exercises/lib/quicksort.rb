  require 'byebug'
class Array
  def quicksort(&prc)
    return self if self.length <= 1
    prc ||= Proc.new { |x, y| x <=> y }
    pivot = self.first
    left = []
    right = []
    i = 0
    while i < self.length
      # debugger
      case prc.call(pivot, self[i])
      when 1 # left
        left << self[i]
      when -1 || 0
        right << self[i]
      end
      i += 1
    end
    left.quicksort(&prc) + [pivot] + right.quicksort(&prc)
  end
end
arr = (1..10).to_a.shuffle
p arr.quicksort

class Array
def bsearch(val, low = 0, high = nil, &prc)
  high = self.length - 1 if high.nil?
  return nil if low > high
  prc ||= Proc.new { |val, curr| val <=> curr }
  mid = (low + high) / 2
  case prc.call(val, self[mid])
  when -1 #search left
    bsearch(val, low, high = mid - 1)
  when 1
    bsearch(val, low = mid + 1, high)
  when 0
    return mid
  end
end
end
arr = (1..10).to_a
arr.bsearch(2)
