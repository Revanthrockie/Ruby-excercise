require './file-manager.rb'
require 'yaml'

class Hangman

    attr_accessor \
    :name,
    :secret_word,
    :chances,
    :dash,
    :guessed_letter

    include FileManager

    def initialize()
        @name = get_player_name 
        @secret_word = set_random_word
        p @secret_word
        @dash = @secret_word.gsub(/[A-Za-z]/, '_').split('')
        @chances = 12
        @guessed_letter = []
        choice 
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

    def choice 
        puts "Enter 1 to start a new game "
        puts "ENter 2 to load a previous game"
        user_input = gets.chomp.strip
        load_file if user_input == '2'
        start_game
    end  

    def start_game
        #create a control flow that gives users 12 guesses and then the game ends.
        #use the same number of fields and give exact number of '_' to replace it with the letter if found in the original word
        #every round check if the user entered a letter and check, if it did not contain the guessed letter  send it to used group
        #let the orignal word be converted to an array so we can track the index of the array 
        #if check_letter is inlcuded in the original word then replace the exact _ with the right index of the original array
        #get the index of the all the same letter and replace the exact letters with dash that many times

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
                    # p guessed_letter
                
                end
                
        
                print "Letters not inlcuded: #{guessed_letter.split('')} \n\n"

                print "Yes! the word was: #{@guess_word} \n You won congratulations #{@name}" if @dash.eql?(array_of_guess_word)
                break if @dash.eql?(array_of_guess_word)
                @chances -= 1
            end
    end
end

