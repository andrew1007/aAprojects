class Code
  attr_reader :pegs

  PEGS = {'red' => 'R', 'green' => 'G', 'blue' => 'B', 'yellow' => 'Y', 'orange' => 'O', 'purple' => 'P'}

  def initialize(pegs)
    @pegs = pegs
  end
  def self.parse(raw_input)
    input = raw_input.upcase
    raise if !valid_colors?(input)
    Code.new(input.split(""))
  end

  def self.random
    random_code = []
    4.times { random_code << PEGS.values.sample }
    Code.new(random_code)
  end

  def exact_matches(input)
    correct_guesses = 0
    input.pegs.each_with_index do |guess, idx|
      correct_guesses += 1 if guess == pegs[idx]
    end
    return correct_guesses
  end

  def near_matches(input)
    near_guesses = []
    input.pegs.each_with_index do |guess, idx|
      is_exact_match = pegs[idx] == guess
      near_guesses << guess if !is_exact_match && pegs.include?(guess)
    end
    return near_guesses.uniq.length
  end

  def self.valid_colors?(input)
    input.each_char do |guess|
      return false if !PEGS.values.include?(guess)
    end
    return true
  end

  def [](i)
    pegs[i]
  end

  def ==(x)
    return false if x.class != Code
    return x.pegs == self.pegs
  end

end

class Game
  attr_reader :secret_code

  def initialize(code = Code.random)
    @secret_code = code
  end

  def get_guess
    p 'what guess?'
    guess = gets.chomp
    guess_code = Code.parse(guess)
    return guess_code
  end

  def display_matches(guess)
    exact_matches = secret_code.exact_matches(guess)
    near_matches = secret_code.near_matches(guess)

    puts "You got #{exact_matches} exact matches!"
    puts "You got #{near_matches} near matches!"
  end

end
