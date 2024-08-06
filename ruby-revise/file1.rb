dictionary = ["below","down","go","going","horn","how","howdy","it","i",
    "low","own", "part","partner","sit"]

def substrings(string, dictionary)
    result = Hash.new()
    string = string.split
    p string
    string.map do |text|
        test_string = text.downcase
        p test_string
        # test each word by scanning through dic
        dictionary.each do |word|
            match = test_string.scan(word).count
            result[word] = match if match != 0
        end
       
    end
    p result
end


substrings("Go",dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)