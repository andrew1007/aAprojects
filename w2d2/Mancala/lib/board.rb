require 'byebug'
class Board
  attr_accessor :cups, :player_1, :player_2

  RANGE = (0..13).to_a * 2
  def initialize(name1, name2)
    @player_1 = name1
    @player_2 = name2
    @cups = place_stones
    @current_player = name1
  end

  def place_stones(marbles = 4)
    stones = [:stone] * marbles
    [stones] * 6 + [[]] + [stones] * 6 + [[]]
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !(1..13).to_a.include?(start_pos)
  end

  def make_move(start_pos, current_player_name)
    marble_count = cups[start_pos].length
    cups[start_pos] = []
    cup_range = RANGE[(start_pos + 1)..(start_pos + marble_count)]
    cup_range = skip_other_players_cup(cup_range, current_player_name)
    play_place_stones(cup_range)
    next_turn(ending_cup_idx = nil)
    render
    return :prompt if is_players_cup?(cup_range.last)
    return :switch if cups[cup_range.last].length == 1
    cup_range.last
  end

  def play_place_stones(cup_range)
    cup_range.each do |idx|
      curr_count = cups[idx].length
      self.cups[idx] = [:stone] * (1 + curr_count)
    end
  end

  def skip_other_players_cup(cup_range, current_player_name)
    if current_player_name == @player_1 && cup_range.include?(13)
      cup_range = cup_range - [13]
      cup_range = cup_range + [cup_range.last - 13]
    elsif cup_range.include?(6) && current_player_name == @player_2
      cup_range = cup_range - [6]
      cup_range = cup_range + [cup_range.last + 2]
    end
    cup_range
  end

  def is_players_cup?(cup)
    cup == 6 || cup == 13
  end


  def next_turn(ending_cup_idx = nil)
    # helper method to determine what #make_move returns
  end

  def switch
    @current_player = (@current_player == player_1) ? player_2 :  player_1
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0...5].all? { |i| i.empty?} || cups[6...12].all? { |i| i.empty?}
  end

  def winner
    if cups[6].length > cups[13].length
      return player_1
    elsif cups[6].length > cups[13].length
      return player_2
    else
      return :draw
    end
  end
end
