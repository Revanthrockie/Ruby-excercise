require "./2d.rb"

module Logic
  include Shapes
  def guess
    won_condition = false
    guessed_code = []
    until won_condition
      puts <<~HEREDOC
      \n\n
      ========================================================
        ___  _                                 
        | _ \\ |__ _ _  _   __ _ __ _ _ __  ___ 
        |  _/ / _` | || | / _` / _` | '  \\/ -_)
        |_| |_\\__,_|\\_, | \\__, \\__,_|_|_|_\\___|
                    |__/  |___/                
      
      ========================================================
      The codes for each color is as follows:
      | 1 | 2 | 3 | 4 | 5 | 6 |
      | #{CIRCLE.colorize(COLORS[1])} | #{CIRCLE.colorize(COLORS[2])} | #{CIRCLE.colorize(COLORS[3])} | #{CIRCLE.colorize(COLORS[4])} | #{CIRCLE.colorize(COLORS[5])} | #{CIRCLE.colorize(COLORS[6])} |

      |if color exists and in right place : #{CIRCLE.colorize(COLORS[8])}
      |if color exist and in wrong place : #{CIRCLE.colorize(COLORS[9])}
      |if color does not exist: " "
      ========================================================\n
      HEREDOC

      puts "Please enter the code: "
    
      p_code = gets.chomp.to_s.split("")
      p_code.map! do |item|
        colors = COLORS[item.to_i]
        CIRCLE.colorize(colors)
      end
      # p p_code
      # puts p_code
      if p_code.length == 4
        guessed_code = p_code
        if guessed_code.eql?(@code)
          p "Motherfucker you won! go suck on your dick now!"
          print "the code was: "
          print_code(guessed_code)
          won_condition = true
        else
          giveHint(guessed_code)
        end  
      else puts "nigga it aint 4!"
      end
    end
  end

  def giveHint(code)
    hint =[ ]
    code.each_with_index do |item, idx|
      if item == @code[idx]
        hint << "#{CIRCLE.colorize(COLORS[8])}"
      elsif @code.include?(code[idx])
        hint << "#{CIRCLE.colorize(COLORS[9])}"
      else 
        hint << "\"\""
      end
    end
    hint.fill(" ",hint.length...code.length)
    print "Hint: "
    print_code(hint)
  end

  def print_code(code)
    code.map do |item|
      if item != " "
        print "| #{item} "
      else
        print "| \" \" "
      end
    end
    print "| \n"
  end
end
