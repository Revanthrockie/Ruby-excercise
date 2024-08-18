class HashMap
  
  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char {|char| hash_code = prime_number * hash_code + char.ord}

    p hash_code 
    return hash_code 
  end


  def set(key,value)
    @key = hash(key) 
    @value = value
    p @key
    p @value
    return 0
  end
end

hash = HashMap.new
p hash.set("laude",56)