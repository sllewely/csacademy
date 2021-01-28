require "pry"

class Node
    attr_accessor :pointer
    attr_reader   :value
  
    def initialize(value, pointer)
      @value = value
      @pointer = pointer
    end
  
    def to_s
      "#{@value} ->"
    end
end

class LinkedList

  attr_accessor


  def initialize
      @head = nil
      @head = @tail
  end

  def prepend(value)
    if @head.nil?
      @head = Node.new(value, nil)
    else
      pointer = @head
      @head = Node.new(value, pointer)
    end
  end

  def append(value)
    if @head.nil?
      @tail =  Node.new(value, nil)
      @head = @tail
    else
      node = Node.new(value, nil)
      @tail.pointer = node
      @tail = node
    end
  end

  def find_tail
    node = @head
    return node if node.pointer.nil?
    until node.pointer.nil?
      node = node.pointer
      return node if node.pointer.nil?
    end 
  end

  def append_after_target(value, target)
    if @head.value == target
      node = Node.new(value, nil)
      node.pointer = @head.pointer
      @head.pointer = node
    else
      node = @head.pointer
      until node.pointer.nil?
        if node.value == target
          new_node = Node.new(value, nil)
          new_node.pointer = node.pointer
          node.pointer = new_node
        end
        node = node.pointer
      end
    end
  end

  def delete(value)
    if @head.value == value
      @head = @head.pointer
    else
      node = @head.pointer
      until node.pointer.nil?
        if node.pointer.value == value
          node.pointer = node.pointer.pointer
        end
        node = node.pointer
      end 
    end
  end

  def find(value)
    node = @head
    until node.pointer.nil?
      return node if node.value == value
      node = node.pointer
    end
    return false
  end

  def find_before(value)
    node = @head
    until node.pointer.nil?
      return node if node.pointer.value == value
      node = node.pointer
    end
    return false
  end

  def print
    node = @head
    puts node
    until node.pointer.nil?
      puts node.pointer
      node = node.pointer
    end
  end

  def pop
    node = @head
    @head = node.pointer
    node.pointer = nil
    return node
  end
  
  def reverse
    new_list = LinkedList.new
    until @head.nil?
      new_node = self.pop
      new_list.prepend(new_node.value)
    end
    new_list
  end
end

my_list = LinkedList.new

my_list.append(1)
# my_list.print
my_list.append(2)
my_list.append(3)
my_list.print
puts "-----------"
my_list.append_after_target(10,1)
my_list.append_after_target(69,10)
my_list.print
puts "--------"
my_list.delete(69)
puts my_list.print
puts "--------------"
puts my_list.find(15)
puts "-------------"
puts my_list.find(2)
puts "-------------"
puts my_list.find_before(2)
puts "-------------"
puts "reversed list should be 3 2 10 1"
puts my_list.reverse.print
#   Implement LinkedList which has 
# node has a value and a pointer that points to the next point Node = Value|Pointer
#   * append (to the front where Head is)_
#   * find_tail
#   * append_after
#   * find
#   * delete
#   * find_before
#   *print :slight_smile: