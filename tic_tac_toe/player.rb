require './board.rb'

class Player 

    include Board

    attr_accessor \
    :name,
    :game_piece


    @@other_game_piece = ""

    def initialize(player_number)
        @name = set_player_name(player_number)
        clear
        @game_piece = set_game_piece(player_number)
        sleep(1)
        clear
    end

    def set_player_name(player_number)
        puts "Player #{player_number}: What is your name?"
        return gets.chomp
     
    end

    def set_game_piece(player_number)
        # make sure to assign a symbol to a player and if that player already has a piece set then try assigning a new sign which wont collide with player2 symbol
        set_piece = false
        game_piece = ""

        until set_piece
         
           puts  "#{@name}: Choose a single letter to represent your piece. \n"
           puts "It cannot be #{@@other_game_piece}" if @@other_game_piece != ""

            game_piece = gets.chomp.upcase

            if game_piece =~ /^[A-Z]\b/ && game_piece != @@other_game_piece
                @@other_game_piece = game_piece
                set_piece = true
            else
                puts "Invalid piece, please choose a single letter"
                
            end
        end
        game_piece
    end 
end
