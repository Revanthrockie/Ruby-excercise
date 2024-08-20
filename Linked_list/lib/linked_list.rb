require_relative './node'

class LinkedList

  def initialize()
    @head = nil
  end

  #adds a new node at the end
  def append(data)
    new_node = Node.new(data)
    if @head.nil?
      @head = new_node
    else
      current = @head
      current = current.next_node while current.next_node != nil
      current.next_node = new_node
    end
    # display(new_node)
  end

  #adds a new node at the start
  def prepend(data)
    new_node = Node.new(data)
    if @head.nil?
      @head = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end
  end

  #returns the size of the list
  def size
    current = @head
    count = 0
    until current.next_node.nil?
      count = count + 1
      current = current.next_node
    end
    count = count + 1 if current.next_node.nil?
    return count
  end

  #returns the first node
  def head
    p @head.value
    return @head.value
  end

  #returns the last node 
  def tail
    current = @head
    current = current.next_node while current.next_node != nil
    p current.value
  end

  #returns the node aat the specified idx
  def at(idx)
    current = @head
    count = 0
    until count == idx
      current = current.next_node
      count += 1
    end
    return current
  end

  #removes the last element from the list
  def pop
    return nil if @head.nil?
    if @head.next_node.nil?
      last_node = @head
      @head = nil
      return last_node
    else
      second_last_node = at(size - 2)
      second_last_node.next_node = nil
      return second_last_node
    end
  end

  #returns a boolean value based on if it exists?
  def contains?(value)
    current = @head
    while current.next_node != nil 
      return true if current.value == value 
      current = current.next_node
    end
    return false
  end

  #returns the idx value of the given argument
  def find(value)
    current = @head
    count = 0
    while current.next_node != nil
      return count if current.value == value
      count += 1
      current = current.next_node
    end
    return nil
  end


  #displays the list in a graphical way
  def display  #<- to_s
    current = @head
    while current
      print "(#{current.value}) -> "
      current = current.next_node
    end
    print "nil "
  end

  #adds an element at the specified index
  def insert_at(v,idx)
    return nil if idx > size - 1
    new_node = Node.new(v)
    if idx == 0
      new_node.next_node = at(idx)
      @head = new_node
    else
      before_temp_node = at(idx - 1)
      temp_node = at(idx)
      before_temp_node.next_node = new_node
      new_node.next_node = temp_node
      while temp_node.next_node != nil
        temp_node = at(idx + 1) 
        idx += 1
      end
    end
  end

  #removes the element from the specified index
  def remove_at(idx)
    return nil if idx > size - 1
    if idx == 0
      @head = at(1)
    else
      before_node = at(idx - 1)
      before_node.next_node = at(idx + 1)
    end
  end

end


list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')
list.display

