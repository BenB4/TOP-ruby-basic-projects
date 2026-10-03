def substrings(string, dictionary)
    valid_substrings = Hash.new(0)
    string_array = string.chars
    dictionary.each do |word|
      string_array.each_with_index do |char, index|
        if word == string_array[index, word.length].join
            valid_substrings[word] += 1
        end
      end
    end
    valid_substrings
end



dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("below", dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)