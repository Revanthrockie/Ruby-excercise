module Display
    class Showcase 
    def showBoard
        clear

        row_1 = "#{Board_position[0]} | #{Board_position[1]} | #{Board_position[2]} "
        row_2 = "#{Board_position[3]} | #{Board_position[4]} | #{Board_position[5]} "
        row_3 = "#{Board_position[6]} | #{Board_position[7]} | #{Board_position[8]} "
        seperator = "---+---+---"

        puts <<~HEREDOC
        |===== ========== ========|
        |===== tic TAC toe =======|
        |=========================|

        #{row_1}
        #{seperator}
        #{row_2}
        #{seperator}
        #{row_3}

        HEREDOC
    end
end


end

print "#{showboard}"
one = Showcase.new()
one.showBoard