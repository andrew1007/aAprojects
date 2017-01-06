

def stringsRearrangement(inputArray)
    i = 0
    while i < inputArray.length
        j = i
        while j < inputArray.length
            return true if inputArray.length == 1
                  print inputArray
            if one_char_diff?(inputArray[i], inputArray[j])
                inputArray.shift
                i = -1
            end
            j += 1
        end
        i += 1
    end
    inputArray.length == 1 ? true : false
end

def one_char_diff?(str1, str2)
    str1 = str1.chars.sort.join
    str2 = str2.chars.sort.join
    char_diff_counter = 0
    i = 0
    while i < str1.length
        if str1[i] != str2[i]
            char_diff_counter += 1
        end
        i+= 1
    end
    char_diff_counter == 1 ? true : false
end
inputArray = ["ab", "bb", "aa"]
stringsRearrangement(inputArray)
