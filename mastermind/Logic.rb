module Guesser

    

    def guess
        p @code #this is generated by random code of 4 digits || && check_limit(current_code)
        function_end = false
        guessed_code = []
        p "enter ur code"
        until function_end
            p "Please enter your code of 4-digits"
            current_code = gets.chomp.to_s.split("")

            if current_code.length == 4 
            guessed_code = current_code 
                if @code.eql?(current_code)
                    p "#{@name} you won!"
                    function_end = true
                else 
                    giveHint(guessed_code)
                end
            end
        end
    end

    def giveHint(code)
        hint = []
        
       @code.each_with_index do |item, idx|
            if item == code[idx]
                hint << "X"
            elsif @code.include?(code[idx])
                hint << "O"
            end   
       end
      
    hint.fill(" ", hint.length...@code.length)
    p hint
    
    end
end