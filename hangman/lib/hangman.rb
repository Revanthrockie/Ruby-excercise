
class Hangman

    attr_accessor \
    :name,
    :guess_word,
    :chances
    :dash

    def initialize()
        @name = get_player_name
        @guess_word = set_random_word
        p @guess_word
        @dash = @guess_word.gsub(/[A-Za-z]/, '_').split('')
        @chances = 12

        start_game
    end

    def get_player_name
        p "please enter your Name: "
        return gets.chomp
    end

    def set_random_word
        file = File.readlines('../google-10000-english-no-swears.txt')
        words = file.select {|word| word.length > 5 && word.length < 12}
        random = words.sample  
        return random[0 , random.length - 1]
    end

    def start_game
        #create a control flow that gives users 12 guesses and then the game ends.
        #use the same number of fields and give exact number of '_' to replace it with the letter if found in the original word
        #every round check if the user entered a letter and check, if it did not contain the guessed letter  send it to used group
        #let the orignal word be converted to an array so we can track the index of the array 
        #if check_letter is inlcuded in the original word then replace the exact _ with the right index of the original array
        #get the index of the all the same letter and replace the exact letters with dash that many times

        guessed_letter = String.new
        game = true


        until @chances == 0

            print "number of chances remaining: #{@chances} \n"
            print "#{@dash.join('')} \n"
            check_letter = gets.chomp.downcase
        

            if @guess_word.include?(check_letter)
                array_of_guess_word =  @guess_word.split('')
                arr2 = array_of_guess_word.each_index.select {|x| array_of_guess_word[x] == check_letter}
                arr2.each do |idx|
                    @dash[idx] = check_letter 
                end
            else  
                guessed_letter += check_letter
            end
            
    
            print "Letters not inlcuded: #{guessed_letter.split('')} \n\n"
            print "Yes! the word was: #{@guess_word} \n You won congratulations #{@name}" if @dash.eql?(array_of_guess_word)
            break if @dash.eql?(array_of_guess_word)
            @chances -= 1
        end
    end
end

