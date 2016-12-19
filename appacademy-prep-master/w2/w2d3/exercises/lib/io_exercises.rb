# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.


  def guessing_game
    random_num = rand(1..100)
    number_of_guesses = 0
    loop do |i|
      print "guess a number\n"
      guess = gets.chomp
      number_of_guesses += 1
      puts guess
      guess_check = guess.to_i <=> random_num
      if guess_check == 0
        puts "You found the number! #{random_num} \n"
        puts "It took you #{number_of_guesses} guesses"
        return
      elsif guess_check == 1
        puts "#{guess} is too high!"
      elsif guess_check == -1
        puts "#{guess} is too low!"
      end
    end
  end

  # * Write a program that prompts the user for a file name, reads that file,
  #   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
  #   could create a random number using the Random class, or you could use the
  #   `shuffle` method in array.

def shuffle_file(file)
  print "Give me a file"
  file_name = gets.chomp
  file_content = File.readlines(file_name)
  new_file = File.open("#{file_name}-shuffled.txt", "w")
  new_file.shuffle!
  new_file.map {|i| puts i}
end
