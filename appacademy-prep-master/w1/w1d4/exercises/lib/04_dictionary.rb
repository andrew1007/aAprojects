class Dictionary

  def initialize
    @dictionary = {}
  end

  def add(entry)
    if entry.class == String
      @dictionary[entry] = nil
    else
      @dictionary = @dictionary.merge(entry)
    end
  end

  def include? (word)
    @dictionary.keys.include? (word)
  end

  def entries
    @dictionary
  end

  def keywords
    words = @dictionary.keys
    sort_and_strify = words.sort
  end

  def find(search)
    key_list = @dictionary.keys #list of words
    matches = key_list.select {|word| partial_match(search, word)} #select partial matches
    search_result = {}
    matches.each {|word| search_result[word] = @dictionary[word]} #add key and value to new hash
    search_result
  end

  def partial_match(str, word)
    range = (str.length) - 1 #find number of letters to look at for each dictionary word
    word[0..range] == str #true/false for partial matches
  end

  def printable
    key_array = @dictionary.keys.sort
    definition_array = @dictionary.values
    leng = key_array.length

    i = 0
    list = ""
    while i < leng
      word = key_array[i]
      definition = @dictionary[word]
      list << "[#{word}] \"#{definition}\"\n"
      i += 1
    end
    return list[0..-2]
  end

  # TODO: your code goes here!

end
#add
#find
#entries
#keywords
#printable
#find
#d=Dictionary.new
#d.add("fiend")
#d.add("great")
#x.find("nothing")
