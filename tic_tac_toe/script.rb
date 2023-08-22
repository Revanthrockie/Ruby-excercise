require './board.rb'

class Tic_Tac_Toe
    include Board

    attr_accessor  \
    :board_position, 
    :winner, 
    :game_over

    def initialize(p1, p2)
        @board_position = ['1','2','3','4','5','6','7','8','9']
        @game_over = false
        @winner = nil
        @p1 = p1
        @p2 = p2
    end

    def game_plan
        player = @p1
        available_position =  board_position.map(&:to_i)
        p available_position

        until game_over
            create_board

            puts "#{player.name}: Please choose a position from the available positions on the board"
            position = gets.chomp.to_i

            if available_position.include?(position)
                available_position.delete(position)
                puts "life is wierd"
                board_position[position-1] = player.game_piece

                check_winner(player)
                puts 'completed'
                check_If_game_over(available_position)

            player == @p1 ? player = @p2 : player = @p1
            end
         end
        display_winner
    end

    def check_If_game_over(available_position)
        @game_over = true if available_position.empty?
    end

    def check_winner(player)
        lines = [
            [0,1,2],
            [3,4,5],
            [6,7,8],
            [0,3,6],
            [1,4,7],
            [2,5,8],
            [0,4,8],
            [2,4,6] 
        ]

        lines.each do |combination|
            arr = combination.map do |position|
                board_position[position]
            end

            if arr.join =~ /#{player.game_piece}{3}/
                p arr
                @winner = player
                @game_over = true;
            end
        end 
    end

    def display_winner
        create_board
        unless @winner.nil?
            puts "#{@winner.name} is the winner"
        else
            puts "Game is draw! Nobody wins"
        end

        if play_again == "Y"
            Tic_Tac_Toe.new(@p1,@p2).game_plan
      
        else
            create_board
            puts "Thank you for playing!"
        end
    end

    def play_again
        puts "Would you like to play again! [Y/N]"
        return gets.chomp.upcase 
    end

end
