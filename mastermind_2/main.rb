require './colorize'
require './logic.rb'
require './2d.rb'

class Mastermind

  include Logic 
  include Shapes

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
    arr = Array.new(4) {(rand(1..6).to_i)}
    arr.map! do |item|
      color = COLORS[item]
      CIRCLE.colorize(color)
    end
    print_code(arr)
    return arr
  end
end

system('clear')
Mastermind.new
