class HumanPlayer
  attr_accessor :board, :ships

  def initialize(name)
    @name = name
  end

  def get_play
    gets.chomp.split(",").map {|coord| coord.gsub(/[^1-9]/,"").to_i}
  end
end
