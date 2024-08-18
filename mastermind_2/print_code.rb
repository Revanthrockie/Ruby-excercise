require 'colorize'
require './2d.rb'

module PrintCode

  include Shapes


  def game_design #the game_layout function
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

    |if color exists and in right place : | #{CIRCLE.colorize(COLORS[1])} | #{CIRCLE.colorize(COLORS[2])} | #{CIRCLE.colorize(COLORS[3])} | #{CIRCLE.colorize(COLORS[4])} | #{CIRCLE.colorize(COLORS[5])} | #{CIRCLE.colorize(COLORS[6])} |
    |if color exist and in wrong place : #{CIRCLE.colorize(COLORS[8])}
    |if color does not exist: #{CIRCLE.colorize(COLORS[9])}

    =========================================================
 
    HEREDOC
  end

  def gamePlayCard #score-card layout
    puts <<~HEREDOC
    \n\n
    Hint: 
    Code: 
 
    HEREDOC
  end

  def code_2_color(code)
    color_arr = code.map {|item| "#{CIRCLE.colorize(COLORS[item])}" }
    print_color(color_arr)
  end

  #print the exact color in | 0 | 0 | 0 | 0 | format
  def print_color(color_code)
    color_code.map do |item|
      if item != " "
        print "| #{item} "
      else
        print "| \" \" "
      end
    end
    print "| \n"
  end
end