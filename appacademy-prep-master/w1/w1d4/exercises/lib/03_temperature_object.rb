class Temperature
  # TODO: your code goes here!
  attr_accessor = :temp

  def self.from_celsius(temp)
    self.new(c: temp)
  end

  def self.from_fahrenheit(temp)
    self.new(f: temp)
  end

  def initialize(temp)
    @temp = temp
  end

  def in_fahrenheit
    return @temp[:f] if @temp.include?(:f)
    to_celsius =  @temp[:c] * 9.0/ 5.0 + 32
    to_celsius
  end

  def in_celsius
    return @temp[:c] if @temp.include?(:c)
    to_farenheit = (@temp[:f] - 32) * 5.0 / 9.0
    to_farenheit
 end
end

class Celsius < Temperature
  def initialize(temperature)
    temp = {}
    temp[:c]= temperature
    @temp = temp
  end
end

class Fahrenheit < Temperature
  def initialize(temperature)
    temp = {}
    temp[:f]= temperature
    @temp = temp
  end
end
