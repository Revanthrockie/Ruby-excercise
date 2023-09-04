require './Logic.rb'

class CodeGuesser

    include Guesser

    attr_accessor \
    :name,
    :code,
    :winner

    def initialize()
        @name = getName
        @code = randomCode

        guess
    end

    def getName
        puts 'Please enter your name'
        name = gets.chomp.upcase
        return name
    end

    def randomCode()
        arr = Array.new(4) {(rand(1..6)).to_i}
        arr.map! do |item| 
            item.to_s
        end
        p arr
    end
  
   
end


rev = CodeGuesser.new
