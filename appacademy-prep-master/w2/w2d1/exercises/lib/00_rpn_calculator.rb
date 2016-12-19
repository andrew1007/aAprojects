class RPNCalculator
  # TODO: your code goes here!
  def initialize(calculator = [])
    @calculator = calculator
  end

  def push(num)
    @calculator << num
  end

  def value
    @calculator.last
  end

  def calc_empty_check
    raise "calculator is empty" if @calculator.length < 2
  end

  def pop_2_and_push(ans)
      @calculator.pop(2)
      @calculator.push(ans)
  end

  def calc_is_empty
    @calculator.length == 0
  end

  def fixnum_to_float
    @calculator.map! {|i| i.to_f}
  end

  def plus
    calc_empty_check
    fixnum_to_float
    plus = @calculator[-2] + @calculator[-1]
    pop_2_and_push(plus)
  end

  def minus
    calc_empty_check
    fixnum_to_float
    minus = @calculator[-2] - @calculator[-1]
    pop_2_and_push(minus)
  end

  def divide
    calc_empty_check
    fixnum_to_float
    divide = @calculator[-2] / @calculator[-1]
    pop_2_and_push(divide)
  end

  def times
    calc_empty_check
    fixnum_to_float
    times = @calculator[-2] * @calculator[-1]
    pop_2_and_push(times)
  end

  def is_num(num)
      num.to_i.to_s == num
  end

  def is_symbol(num)
    num.class == Symbol
  end

  def tokens(str)
    arr = str.split(" ")
    tokens = arr.map {|i| (is_num(i))? i.to_i : i.to_sym}
  end

  def evaluate(str)
    arr = tokens(str)
    arr.map! {|i| (i.class == Fixnum)? i.to_f : i}
    leng = arr.length
    eval_arr = []
    i=0
    while i < leng
      eval_arr << arr[i]
      if is_symbol(eval_arr[-1])
        symbol = eval_arr[-1]
        operation = eval_arr[-3..-2].reduce(symbol)
        eval_arr.pop(3)
        eval_arr.push(operation)
      end
      i += 1
    end
    return eval_arr[0].to_f
  end

end
