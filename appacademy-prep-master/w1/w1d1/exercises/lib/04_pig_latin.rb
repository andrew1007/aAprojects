#helper function that tests if a letter in a position is a vowel or not
def vowel_test(letters, &block)
  if letters.class == String
    arr = letters.split("")
  end
  vowels = Proc.new {|i| i=="a" || i=="e" || i=="i" || i=="o" ||i=="u"}
  test = arr.select(&vowels)
  if test !=[]
    return true
  elsif test == []
    return false
  end
end

def translate(statement)
  pig_latined = []
  arr = statement.split(" ")
  arr.each do |word|
    #all 3 below are a switch of 3 constant to back
    #qu as phenome, "qu" and a vowel
  if word[0..1].include?("qu")==true && vowel_test(word[2])==true
    pig = word[2..-1]+word[0..1]+"ay"
    #qu with constant as 3rd
  elsif (word[1..2].include?("qu")) && vowel_test(word[0])==false
      pig = word[3..-1]+word[0..2]+"ay"
      #3 constants
  elsif vowel_test(word[0..2])==false
    pig = word[3..-1]+word[0..2]+"ay"
    #2 constants in front
  elsif vowel_test(word[0..1])==false && vowel_test(word[2])==true
    pig = word[2..-1]+word[0..1]+"ay"
    #begins with vowel
  elsif vowel_test(word[0])==true && vowel_test(word[1])==false
      pig = word + "ay"
      #begins with 2 vowels
  elsif vowel_test(word[0])==true && vowel_test(word[1])==true
    pig = word + "ay"
      #begins with constant
    elsif vowel_test(word[0])==false && vowel_test(word[1])==true
      pig = word[1..-1]+word[0]+"ay"
      end

    pig_latined << pig
  end
  return pig_latined.join(" ")
end
