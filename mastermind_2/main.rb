require 'colorize'
require './logic.rb'
require './2d.rb'
require './print_code.rb'

class Mastermind

  include Logic 
  include Shapes
  include PrintCode

  attr_accessor :name , :code 

  def initialize()
    @name = get_name
    @code = random_code 

    guess
  end

  def get_name
    puts "Enter your name: "
    name = gets.chomp.capitalize
    # puts "The color is #{CIRCLE.colorize(COLORS[8])}"
    return name
  end

  def random_code
    arr = Array.new(4) {(rand(1..6))}
    p arr
    # code_2_color(arr.join(""))
    return arr
  end
end

system('clear')
Mastermind.new
