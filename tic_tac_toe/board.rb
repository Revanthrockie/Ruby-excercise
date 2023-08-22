module Board

    def create_board
        clear 

        row_1 = "#{board_position[0]} | #{board_position[1]} | #{board_position[2]}"
        row_2 = "#{board_position[3]} | #{board_position[4]} | #{board_position[5]}"
        row_3 = "#{board_position[6]} | #{board_position[7]} | #{board_position[8]}"
        seperator = "--+---+--"

        puts <<~HEREDOC
        |===========================|
        |==========tictactoe========|
        |===========================|


        #{row_1}    | #{@p1.name} , Piece: #{@p1.game_piece}
        #{seperator}    | #{@p2.name} , Piece: #{@p2.game_piece}
        #{row_2}    *--------------
        #{seperator}
        #{row_3}

            HEREDOC
    end

    # def welcome
    #     | ======= welcome =========|
    # end

    def clear
        system ('clear')
    end

end