class ComputerPlayer
  attr_accessor :guess, :display, :candidate_words

  def initialize(dictionary)
    @smart_alphabet = ("a".."z").to_a
    @dictionary = dictionary
  end

  def pick_secret_word
    @secret_word = @dictionary.sample
    @secret_word.length
    #file = File.readlines("text.txt")
    #file.sample
  end

  def register_secret_length(leng)
    @candidate_words = @dictionary.select {|i| i.length == leng}
  end
  #def get_guess
  #  gets.chomp
  #end

  def guess(board="")
    letters = ("a".."z").to_a.sample
    #p "guess"
    #x = gets.chomp
    modify_smart_alphabet(board)
    if !board.include?(letters)
      guess = smart_guess
    else
      guess = @smart_alphabet.sample
    end
    @smart_alphabet.delete_if {|letter| letter == guess}
    return guess
  end

  def check_guess(guess)
    corr_pos = []
    word_check = @secret_word.split("")
    word_check.each_with_index do |i, index|
      corr_pos << index if i == guess
    end
    corr_pos
  end

  def handle_response(guess, indexes)
    potential_words = []
    @candidate_words.each do |word|
      word_index = []
      word_split = word.split("")
      word_split.each_with_index do |i, index|
        word_index << index if word_split[index] == guess
      end
      potential_words << word if word_index == indexes
    end
    @candidate_words = potential_words
  end

  def smart_guess
    all_letters = @candidate_words.flatten.join("")
    hash = Hash.new
    @smart_alphabet.each do |letter|
      counted = all_letters.count(letter)
      hash[letter] = counted
    end
    most_common = hash.select {|key, value| hash[key] == hash.values.max}
    common_letter = most_common.keys[0]
    return common_letter
  end

  def modify_smart_alphabet(arr)
    letters = arr.compact.uniq
    letters.each do |letter|
      @smart_alphabet.delete_if {|i| i == letter}
    end
  end
end

class Hangman
  attr_accessor :guesser, :referee, :update_board
  #make into options hash
  def initialize(players)
    @guesser = players[:guesser]
    @referee = players[:referee]
  end

  def register_secret_length(secret_length)
    p "it is #{secret_length} letters long"
  end

  def setup
    #p "secret word?"
    secret_length = @referee.pick_secret_word
    tell_length = @guesser.register_secret_length(secret_length)
    @board = [nil] * secret_length
  end

  def board
    @board
  end

  def take_turn
    #p "guess?"
    guesser_guess = @guesser.guess(@board)
    pos = @referee.check_guess(guesser_guess)
  #  p guesser_guess
    update_board(pos, guesser_guess)
    @guesser.handle_response
  end

  def guess(board)
    p board
    puts "Input guess:"
    gets.chomp
  end
#  def handle_response(guesser_guess, response)
  #  "guessed #{guesser_guess}"
#  end

  #it "updates the board" do
  #  expect(game).to receive(:update_board)
  def update_board(indexes, guess)
    indexes.each {|i| @board[i] = guess}
  end

end

class HumanPlayer
  attr_accessor :guess, :display

  def initialize(dictionary)
    @dictionary = dictionary
  end

  def register_secret_length(length)
    p "length?"
    until length.to_i > 0
      get = gets.chomp
      length = get.gsub(/[a-zA-Z]/, "")
    end
  end

  def check_guess(guess)
    corr_pos = []
    word_check = @secret_word.split("")
    word_check.each_with_index do |i, index|
      corr_pos << index if i == guess
    end
    corr_pos
  end

  def guess(board)
  end
  def hand_response(guess)
    p "you guessed #{guess}"
  end
end

#We'll start out with the computer
##choosing the secret word and the human
#trying to guess it.
