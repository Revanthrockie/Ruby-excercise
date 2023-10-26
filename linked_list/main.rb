# frozen_string_literal: true
require_relative './linked.rb'
require_relative './Node'

test = Linked_list.new
test.append('Manuevar')
test.prepend('Onomatopoiea')
test.append('lieutenant')
puts test
puts test.at_index(3)
puts test
puts test
puts test.contains?('lieutenant')
puts test.contains?('Manuevar')
puts test.find('Manuevar')
puts test.find('lieutenant')
puts test.append('flare')
puts test.insert_at('misery', 3)
puts test
puts test.remove_at(2)
puts test