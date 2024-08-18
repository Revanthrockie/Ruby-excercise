require "./2d.rb"
require "./print_code.rb"

module Logic

  include Shapes
  include PrintCode

  def guess
    won_condition = false
    guessed_code = []
    until won_condition
      game_design

      puts "Please enter the code: "
    
      p_code = gets.chomp.to_i.digits.reverse!
      code_2_color(p_code)
      puts "after the fucntion #{p_code}"
      
      if p_code.length == 4
        guessed_code = p_code
        p @code
        if guessed_code.eql?(@code)
          p "Motherfucker you won! go suck on your dick now!"
          print "the code was: "
          code_2_color(guessed_code)
          won_condition = true
        else
          giveHint(guessed_code)
        end  
      else puts "nigga it aint 4!"
      end
    end
  end

  def giveHint(code)
    p "in the given hint #{code}"
    hint =[ ]
    code.each_with_index do |item, idx|
      if item == @code[idx]
        hint << item
      elsif @code.include?(code[idx])
        hint << 8
      else 
        hint << 9
      end
    end
    # hint.fill(" ",hint.length...code.length)
    print "Hint: "
    code_2_color(hint)
  end

  
end

#make a function that asks for whether to ask the computer or run the program urself
#take user input and make a function that assign the color and code to a secret stash
#let the computer try to figure each word by taking hints and try different combination to guess the answer
