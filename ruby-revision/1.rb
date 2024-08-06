require 'pry-byebug'

def isogram?(string)
  original_length = string.length 
  string_array = string.downcase.split
  binding.pry
  puts string_array
  unique_length = string_array.uniq.length
  puts original_length == unique_length
end

isogram?("Revant")