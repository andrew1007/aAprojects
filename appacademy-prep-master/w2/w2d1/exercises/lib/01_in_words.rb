class Fixnum
  attr_accessor :number
  def initialize(number)
    @number = number
  end

  def hash_tables
    ones_word = [nil ,nil, "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]
    ones_digit = [nil] + (0..10).to_a
    ones_hash = Hash[ones_digit.zip(ones_word)]

    teens_word = ["eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen" ]
    teens_digit = (11..19).to_a
    teens_hash = Hash[teens_digit.zip(teens_word)]

    tens_word = [nil, nil, "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
    tens_digit = [nil] + (0..9).to_a.map {|i| i * 10}
    tens_hash = Hash[tens_digit.zip(tens_word)]

    magnitude_word = [nil, "hundred", "thousand", "million", "billion", "trillion"]
    magnitude_digits = [1, 100, 1000, 1000000, 1000000000, 1000000000000]
    magnitude_hash = Hash[magnitude_digits.zip(magnitude_word)]

    return ones_hash, teens_hash, tens_hash, magnitude_hash
  end

  def in_words
    magnitude_digits = hash_tables[3].keys
    magnitude_words = hash_tables[3].values
    scaled_down = sequential_division
    return "zero" if scaled_down == "zero"
    puts scaled_down
    in_words = scaled_down.map {|i| what_func_to_use(i)}.reverse
    #puts in_words
    stop = in_words.length
    words = add_magnitude_words(in_words, magnitude_words, 0, stop)
    return words.compact.reverse.join(" ")
  end

  def add_magnitude_words(arr, magnitude_words, start, stop)
    words = []
    i = start
    while i < stop
      if !arr[i].nil?
        words << magnitude_words[i]
      end
      words << arr[i]
      i += 1
    end
    return words
  end

  def remove_trailing_zeros(arr)
    until arr[-1] != 0
      arr.pop
      arr
    end
    return arr
  end

  def sequential_division
    magnitude_digits = hash_tables[3].keys
    broken_down = []
    num = self
    all_divided = magnitude_digits.map {|i| num/i}
    if all_divided.uniq == [0]
      return "zero"
    end
    non_zero = remove_trailing_zeros(all_divided)
    non_zero = all_divided.select {|i| i != 0}.length
    range = non_zero -1
    arr = magnitude_digits[0..range].reverse
    arr.each do |mag|
      remainder = num%mag
      num = num/mag
      broken_down << num
      num = remainder
    end
    return broken_down
  end

  def output_ones(num)
    ones_hash = hash_tables[0]
    return ones_hash[num]
  end

  def output_teens(num)
    teens_hash = hash_tables[1]
    return teens_hash[num]
  end

  def output_tens(num)
    ones_hash = hash_tables[0]
    tens_hash = hash_tables[2]
    tens = num / 10 * 10
    tens_number = tens_hash[tens]
    if num % 10 != 0
      remainder = num % 10
      ones_digit = " " + ones_hash[remainder]
    end
    return "#{tens_number}#{ones_digit}"
  end

  def what_func_to_use(num)
    if num <= 10
      return output_ones(num)
    elsif num < 20 && num >10
      return output_teens(num)
    elsif num < 100 && num >= 20
      return output_tens(num)
    elsif num < 1000 && num >= 100
      num_str = num.to_s
      output_ones(num_str[0].to_i) << " hundred " << output_tens(num_str[1..2].to_i)
    end
  end
end

1_888_259_040_036.in_words
