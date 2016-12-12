def sudo_sq_build(arr1, arr2)
  sudo_arr_set = (0...3).to_a
  final_arr_set = []
    arr1.each do |x|
      subarr_subset = []
      arr2.each do |y|
        coord = [x, y]
        subarr_subset << coord
      end
      final_arr_set += subarr_subset
    end
  final_arr_set
end

sudo_sq_build((0...3).to_a, (0...3).to_a)
arr = [(0...3).to_a, (3...6).to_a, (6...9).to_a]

arr_new = []
arr.each do |arr1|
  arr.each do |arr2|
    arr_new << sudo_sq_build(arr1, arr2)
  end
end
arr_new
