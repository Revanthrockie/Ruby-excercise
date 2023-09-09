
module Game

    FILE = File.readlines('google-10000-english-no-swears.txt')
    WORDS = file.select {|word| word.length > 5 && word.length < 12}
    RANDOM = words.sample



end



