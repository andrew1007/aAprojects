#Simon says
def echo(statement)
  return "#{statement}"
end

#Simon shots
def shout(statement)
  return "#{statement.upcase}"
end

#repeat
def repeat(statement, rep=2)
  arr = [statement]
  repped = arr*rep
  back_to_str = repped.join(" ")
  return back_to_str
end

#start of word
def start_of_word(name, max_range)
  return name[0...max_range]
end

#first_word
def first_word(sentence)
  return sentence.split(" ")[0]
end

def is_exception
  return ["The", "And", "Over"]
end

#titleize
def titleize(word, &block)
  titleized = []
  words = word.split(" ")
  all_upper= words.map {|i| i.capitalize}
  exceptions = ["The", "And", "Over"]
  all_upper.each do |word|
    if exceptions.include?(word)
      titleized << word.downcase
    else
      titleized << word
    end
  end
  titleized[0] = titleized[0].capitalize
  return titleized.join(" ")
end
