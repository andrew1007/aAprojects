class Tile
  attr_accessor :default_tile, :number
  def initialize(default_tile = true, number = nil, pos = nil)
    @default_tile = default_tile
    @number = number
    @pos = pos
  end
end
