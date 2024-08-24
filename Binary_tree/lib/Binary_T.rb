require_relative './node'

class Tree 
  attr_accessor :root
  
  def initialize(array)
    @array = array.uniq!.sort!
    @root = build_tree(array)
  end

  def build_tree(arr)
    return nil if arr.empty?

    mid = (arr.size - 1) / 2
    root_node = Node.new(arr[mid])

    root_node.left = build_tree(arr[0...mid])
    root_node.right = build_tree(arr[mid+1..-1])

    root_node
  end

  def pretty_print(node = root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def print_node(node)
    print "\n\nValue: #{node.value} , r-value: #{node.right} , l-value: #{node.left} \n\n"
  end
  
  def insert(value)
    current = @root
    until current.left.nil? && current.right.nil?
      if current.value > value
        current = current.left
      else
        current = current.right
      end
    end
    current.value > value ? current.left = Node.new(value) : current.right = Node.new(value)
  end

  # def delete(node_val)
  #   if find(node_val)
  #     current = @root
  #     until current.value == value
  #       if current.value == value 
  #         current.value == nil
  #     ends
  #   end
  # end

  def find(value)
    current = @root
    until current.left.nil? && current.right.nil?
      current.value > value ? current = current.left : current = current.right
      return print_node(current) if current.value == value 
      return current if current.value == value 
    end
    puts 'value does not exist'
    return false
  end

end


binary = Tree.new([23,24,51,6,6,1,2,4,5,6,2,6,23,])
binary.pretty_print
binary.insert(3)
binary.insert(29)
binary.insert(45)
binary.insert(32)
binary.insert(22)
binary.pretty_print
binary.find(3)
# binary.find(0)
binary.pretty_print
binary.delete(0)




