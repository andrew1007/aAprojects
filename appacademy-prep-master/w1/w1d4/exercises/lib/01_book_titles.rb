class Book

  attr_reader :title, :exceptions

  def initialize
    @exceptions = ["the", "a", "an", "and", "in", "of"]
  end

  def title=(book)
    word_arr = book.split(" ")
    selection = word_arr.map {|word| (@exceptions.include?(word))?
      word : word.capitalize}
    selection[0] = selection[0].capitalize
    @title = selection.join(" ")
  end

end
