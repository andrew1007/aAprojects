def p1_anagrams(str1, str2)
  anagram_arr = str1.split("").permutation.to_a
  anagram_arr.include?(str2.split(""))
end

p2_anagrams("gizmo", "sally")    #=> false
p2_anagrams("elvis", "lives")

def p2_anagrams(str1, str2)
  return false unless str1.length == str2.length
  until str1.empty?
    ch = str1[0]
    str1 = str1.sub(ch,"")
    str2 = str2.sub(ch,"")
  end
  str2.empty?
end

def p3_anagrams(str1, str2)
  str1.chars.sort == str2.chars.sort
end
p3_anagrams("gizmo", "sally")    #=> false
p3_anagrams("elvis", "lives")

def p4_anagrams(str1, str2)
  letters = (str1.chars + str2.chars).uniq
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  letters.each do |el|
    hash1[el] += 1
    hash2[el] += 1
  end
  hash1 == hash2
end

p4_anagrams("gizmo", "sally")    #=> false
p4_anagrams("elvis", "lives")

def b_anagrams(str1, str2)
  hash = Hash.new( 0 )
  str1.each_char { |ch| hash[ch] += 1 }
  str2.each_char { |ch| hash[ch] -= 1 }
  hash.all? { |k, v| v == 0 }
end
