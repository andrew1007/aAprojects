require_relative ""../w2d1/00_rpn_calculator""

class RPNCalculator
  # TODO: your code goes here!
  def run(file)
    file.each do |line|
      line = line.chomp
      calc = RPNCalculator.new
      puts calc.evaluate(line)
    end
  end

  def initialize(calculator)
    @math_expression = calculator
  end

  def pop_2_and_push(value)
      self.pop(2)
      self.push(value)
      value
  end

  def calc_is_empty
    if self.length < 2
      return true
    end
  end

  def fixnum_to_float
    self.map! {|i| i.to_f}
  end

  def plus
    if self.calc_is_empty == true
      return "calculator is empty"
    end
    self.fixnum_to_float
    plus = self[-2] + self[-1]
    self.pop_2_and_push(plus)
  end

  def minus
    if self.calc_is_empty == true
      return "calculator is empty"
    end
    self.fixnum_to_float
    minus = self[-2] - self[-1]
    self.pop_2_and_push(minus)
  end

  def divide
    if self.calc_is_empty == true
      return "calculator is empty"
    end
    self.fixnum_to_float
    divide = self[-2] / self[-1]
    self.pop_2_and_push(divide)
  end

  def times
    if self.calc_is_empty == true
      return "calculator is empty"
    end
    self.fixnum_to_float
    times = self[-2] * self[-1]
    self.pop_2_and_push(times)
  end

  def is_num
      self.to_i.to_s == self
  end

  def is_symbol
    self.class == Symbol
  end

  def tokens(str)
    arr = str.split(" ")
    tokens = arr.map {|i| (i.is_num)? i.to_i : i.to_sym}
  end

  def evaluate(str)
    arr = tokens(str)
    leng = arr.length
    eval_arr = []
    i=0
    while i < leng
      eval_arr << arr[i]
      if eval_arr[-1].is_symbol
        symbol = eval_arr[-1]
        operation = eval_arr[-3..-2].reduce(symbol)
        eval_arr.pop(3)
        eval_arr.push(operation)
      end
      i += 1
    end
    eval_arr[0].to_f
  end
end
