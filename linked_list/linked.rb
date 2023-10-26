# frozen_string_literal: true
require_relative './Node'

# Class to create and manage linked list objects

class Linked_list

    attr_accessor :head, :tail

    def initialize
        @head = nil
        @tail = nil
    end
   
    #adds a new node at the end of the list 
    def append(value)
        new_node = Node.new(value)
        @head = new_node unless @head
        if !@tail
            @tail = new_node
        else 
            @tail.next_node = new_node
        end
        @tail = new_node
    end

    #adds a new node in front of the list
    def prepend(value)
        new_node = Node.new(value, @head)
        @head = new_node
    end

    #returns the size of the list
    def size
        count = 0
        current_node = @head
        until current_node.nil?
            count += 1
            current_node = current_node.next_node
        end
        count
    end

    #returns the index of the node
    def at_index(index , node = head , count = 0)
         return "the index is invalid" if index >= self.size || index > self.size - 1
         return node if index == count
         return nil if last_node?(node)

         #recursive method
         at_index(index, node.next_node , count + 1)
    end

    #pops the last node
    def pop(node = head)
        return node.next_node = nil if last_node?(node.next_node)
         #recursive method
        pop(node.next_node)
    end

    #check if the given value is found in the given list
    def contains?(value, node = head)
        return true if node.value == value 
        return false if last_node?(node) 

        contains?(value, node.next_node)
    end

    #returns a boolean value based on the value found
    def find(value , node = head , index = 0)
        return "provided node doesn't exist" if contains?(value) == false
        return index if node.value == value

        #recursive function
        find(value , node.next_node, index + 1)
    end

    #prints entire linked_list
    def print_list
        current_node = @head
        list_end = false
        until list_end
            puts current_node
            if current_node == @tail
                list_end = true
            else  
                current_node = current_node.next_node
            end
        end
    end

    #insert given value at specified index
    def insert_at(value , index, counter = 0)
        return 'Unreachable index!' if at_index(index).nil?
        return at_index(index-1).next_node = create_node(value, at_index(index)) if index == counter

        insert_at(value, index, counter + 1)
    end

    #remove the node from the specified index
    def remove_at(index , counter = 0)
        return 'Unreachable index!' if at_index(index).nil?
        return at_index(index - 1).next_node = at_index(index + 1) if index == counter

        remove_at(index, counter + 1)
    end

    # create a new node
    def create_node(value = nil, next_node = nil)
        Node.new(value,next_node)
    end
    
    #check if current node is last node
    def last_node?(node)
        return true if node.next_node.nil?
        false
    end
    

    #returns the linked list in a string format
    def to_s(node = head , string = '')
        return string += "( #{node.value} ) -> nil" if last_node?(node)

        string += "( #{node.value} ) -> "
        to_s(node.next_node, string)
    end

end