module Board

    def create_board
        row_1 = "#{Board_position[0]} | #{Board_position[1]} | #{Board_position[2]}"
        row_2 = "#{Board_position[3]} | #{Board_position[4]} | #{Board_position[5]}"
        row_3 = "#{Board_position[6]} | #{Board_position[7]} | #{Board_position[8]}"
        seperator = "---+---+---"

        puts <<~HEREDOC
        |===========================|
        \==========tictactoe=========\
        |===========================|


        #{row_1}    |#{player_1.name , player_1.symbol}
        #{seperator}    |#{player_2.name , player_2.symbol}
        #{row_2}    *--------------
        #{seperator}
        #{row_3}

            HEREDOC
    end


end