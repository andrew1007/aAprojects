[1,3,4,5].inject do |acc, x|
  acc * x
end

def fact_seq(n)
  return [1] if n == 1
  fact_seq(n - 1) << fact_seq(n - 1).last * (n - 1)
end

def bsearch(arr, val)
  return nil if arr.empty?
  mid = arr.length / 2
  case val <=> arr[mid]
  when -1
    bsearch(arr.take(mid), val)
  when 1
    sub_ans = bsearch(arr.drop(mid + 1), val)
    (mid + 1) + sub_ans
  when 0 then return mid
  end
end
bsearch((1..10).to_a, 4)

def array_subsets(arr)
  return [[]] if arr.empty?
  subs = array_subsets(arr[1..-1])
  subs + subs.map {|el| el + [arr.first]}
end



array_subsets([1,3])

[1,3,4,1].take(3)

def fact_seq(n)
  return [1] if n == 0
  fact_seq(n - 1) << fact_seq(n - 1).last * n
end
fact_seq(5)

def quicksort(&prc)
  return self if self.length <= 1
  prc ||= Proc.new { |x, y| x <=> y }
  pivot = self.first
  left = []
  while i < self.length
    case prc.call()
  end
    left << self[i] if
end
