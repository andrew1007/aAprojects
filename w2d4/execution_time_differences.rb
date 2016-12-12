def my_min(list)
  list.each do |el1|
    is_min = true
    list.each do |el2|
      is_min = false if el2 < el1
    end
    return el1 if is_min
  end
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
my_min(list)  # =>  -5

def my_min_better(list)
  min_value = list[0]
  list.each do |v|
    min_value = v if v < min_value
  end
  min_value
end

def largest_contiguous_subsum(list)
  sub_arrs = []
  list.length.times do |i|
    (i...list.length).each do |j|
      sub_arrs << list[i..j]
    end
  end
  max_sub_arr = sub_arrs.max_by { |arr| arr.inject(&:+) }
  max_sub_arr.inject(&:+)
end
list = [2, 3, -6, 7, -6, 7]
largest_contiguous_subsum(list)

def largest_sum(list)
  max_sum = list.max
  return max_sum if list.all? { |el| el < 0 }
  curr_sum = 0
  list.each do |el|
    curr_sum += el
    curr_sum = 0 if curr_sum < 0
    max_sum = curr_sum if curr_sum > max_sum
  end
  max_sum
end
