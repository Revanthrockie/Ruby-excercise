module Enumerable
  # Your code goes here
  def my_each
    i = 0
    until i == self.length do
      yield self[i] 
      i += 1
    end
  end

  def my_each_with_index 
    if block_given? 
      i = 0
      until i == self.length do
        yield(self[i] , i)
        i += 1
      end
    end
    self
  end

  def my_select
     arr = []
     my_each do |item|
      arr << item if yield (item)
    end
    arr
  end

  def my_all?
    each do |item|
      return false unless yield(item)
    end
    true
  end

  def my_any?
    each do |item|
      return true if yield(item)
    end
    false
  end
 
  def my_count
    i = 0
    if block_given?
      each do |item|
        i += 1 if yield(item)
      end
    else
      each do |item|
        i += 1
      end
    end
    return i
  end

  def my_none?
    each do |item|
      return false if yield(item)
    end
    true
  end

  def my_map 
    if block_given?
      arr = []
      self.each do |item|
       arr << yield(item)
      end
      arr
    end
  end

  def my_inject(value = nil)
    result = value
  
    self.each do |item|
      if result.nil?
        result = item
      else
      result = yield(result , item)
      end
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
      if block_given?
      i = 0
      while i < length
        yield self[i]
        i += 1
      end
    end
    self
  end
end
