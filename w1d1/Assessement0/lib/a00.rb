# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
  alpha = ("a".."z").to_a
  nums = (1..27).to_a
  hash_alpha = Hash[alpha.zip(nums)]
  hash_num = Hash[nums.zip(alpha)]
  total_arr = []
  word_arr = str.split(" ")
  word_arr.each do |word|
    arr = []
    str_arr = word.split("")
    str_arr.each do |char|
      if hash_alpha[char] + shift < 27
        arr << hash_alpha[char] + shift
      else
        arr << (hash_alpha[char] + shift - 26)
      end
    end
    total_arr << arr.map { |num| hash_num[num]}.join("")
  end
  total_arr.join(" ")
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)
  num_arr = num_arred(num)
  summed = num_arr.reduce(:+)
  if summed > 10
    summed = num_arred(summed).reduce(:+)
  end
  summed
end

def num_arred(num)
  num.to_s.split("").map {|i| i.to_i}
end
# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  return str.split("").sort.join("") if alphabet.nil?
  str_arr = str.split("")
  arr = []
  alphabet.each do |alpha|
    curr_lett = alpha
    str_arr.each do |chr|
      arr << chr if chr == curr_lett
    end
  end
  arr.join("")
end

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    arr = []
    self.each_with_index do |num1, idx1|
      break if self[idx1 + 1].nil?
      self.each_with_index do |num2, idx2|
        next if idx1 >= idx2
        arr << [idx1, idx2] if num1 + num2 == 0
      end
    end
    arr.sort
  end
end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    subwords = []
    str_arr = self.split("")
    str_arr.each_with_index do |str1, idx1|
      subwords << str1 if dictionary.include?(str1)
      test_str = str1
      str_arr.each_with_index do |str2, idx2|
        next if idx1 >= idx2
        test_str += str2
        subwords << test_str.dup if dictionary.include?(test_str)
      end
    end
    subwords.uniq
  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  (1..num).to_a.select { |fact| num % fact == 0}
end
