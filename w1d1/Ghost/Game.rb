class Ghost
  attr_accessor :fragment, :players_hash
  attr_reader :player1, :player2, :current_player, :dictionary

  def initialize(dictionary, *arr)
    @players_hash = player_hash_build(arr)
    @dictionary = build_dict(dictionary)
    @fragment = ""
    @current_player = @players_hash[0]
  end

  def play_round
    return player_name if players_hash.count == 1
    take_turn(current_player)
    if check_dict(fragment)
      p '#{current_player.name} lost'
      current_player.loss_count += 1
    end
    switch_players!
    delete_loser
  end

  def player_name
    current_player.name
  end

  def delete_loser
    @players_hash.delete(curr_player_key) if current_player.loss_count == 5
  end

  def take_turn(player)
    letter = gets.chomp
    @fragment += letter
    if !valid_play?(fragment)
      p "invalid play"
      @fragment = fragment[0...-1]
      take_turn(current_player)
    end
  end

  def valid_play?(string)
    word_cuttoff(string).include?(string)
  end

  def word_cuttoff(string)
    word_arr = dictionary[string[0]]
    word_arr.map { |i| i[0...string.length] }
  end

  def check_dict(word)
    dictionary[word[0]].include?(word)
  end

  def build_dict(file_name)
    dictionary = Hash.new {}
    ("a".."z").to_a.each do |letter|
      dictionary[letter] = []
    end

    word_arr = File.readlines(file_name)
    word_arr.each do |word|
      first_letter = word[0]
      dictionary[first_letter] << word.gsub("\n","")
    end

    dictionary
  end

  def player_hash_build(arr)
    player_hash = {}
    arr.each_with_index do |player, idx|
      player_hash[idx] = Player.new(player)
    end
    player_hash
  end

  def switch_players!
    @current_player = players_hash[(curr_player_key + 1) % players_hash.keys.count]
  end

  def curr_player_key
    curr_player_key = players_hash.select { |key, values| values == @current_player}.keys[0]
  end
end


FileUtils.cd('/home/andrew/Dropbox/AppAcademyfiles/w1d1/Ghost')
x = Ghost.new("dictionary.txt", "Anton", "Andrew", "Taylor")
x.play_round
