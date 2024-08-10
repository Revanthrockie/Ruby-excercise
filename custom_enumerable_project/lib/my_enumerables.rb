module Enumerable
  # Your code goes here
  # Each method is written without depending on the already written code just to make sure how each chode works.
  def my_each
    i = 0
    until i == self.length
      yield(self[i])
      i = i + 1
    end
    return self
  end

  def my_each_with_index
    i = 0
    until i == self.length
      yield(self[i],i)
      i = i + 1
    end
    return self
  end

  #For both my_each and my_each_with_index p self will return the original array that was given in as input 
  #Try adding p yield(self[i]) or p yield(self[i],i) to check the value.

  def my_select
    i = 0
    arr = Array.new
    until i == self.length
      arr << self[i] if yield(self[i])
      i = i + 1
    end
    # p arr         <- uncomment this to check the answer in your terminal
    return arr
  end

  def my_all?
    i = 0
    value = nil
    until i == self.length
      value = yield(self[i])
      i = i + 1
    end
    # p value         <- uncomment this to check the answer in your terminal
    return value
  end

  def my_any?
    i = 0
    value = nil
    until i == self.length
      value = true if yield(self[i])
      i = i + 1
    end
    # p value         <- uncomment this to check the answer in your terminal
    return value = false if value != true
    return value
  end

  def my_none?
    i = 0
    value = nil
    until i == self.length
      value = false if yield(self[i])
      i = i + 1
    end
    # p value           <- uncomment this to check the answer in your terminal
    return value = true if value != false
    return value
  end

  def my_count
    value = self.length
    arr = Array.new
    if block_given? == false
      return value 
    else
      i = 0
      until i == value
        arr << self[i] if yield(self[i])
        i = i + 1
      end
      # p value = arr.length          <- uncomment this to check the answer in your terminal
      return value = arr.length
    end
  end

  def my_map
    i = 0
    arr = Array.new
    until i == self.length
      arr << yield(self[i])
      i = i + 1
    end
    # p arr         <- uncomment this to check the answer in your terminal
    return arr
  end
  
  def my_inject(v1 = 0)
      i = 0
      value = v1
      until i == self.length
        value = yield(value,self[i])
        i = i + 1
      end
      # p value         <- uncomment this to check the answer in your terminal
      return value
  end

end

# uncomment each method and check the value

# a = [1,2,3,4]
# a.my_each {|n| print n}
# a.my_each_with_index {|n,i| print "#{n}is at location #{i}"}
# a.my_select {|n| n > 2}
# a.my_all? {|n| n > 0}
# a.my_any? {|n| print n>3}
# a.my_none? {|n| print n>3}
# a.my_count {|n| n > 1}
# a.my_map {|n| n * 3}
# a.my_inject(2) {|v,n| v + n }