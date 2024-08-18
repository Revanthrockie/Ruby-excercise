# require_relative './linked_list.rb'

class Node
  attr_reader :value 
  attr_accessor :next_node

  def initialize(data)
    @value = data
    @next_node = nil
  end
end
