require './player.rb'
require './script.rb'

p1 = Player.new(1)
p2 = Player.new(2)
game = Tic_Tac_Toe.new(p1,p2).game_plan