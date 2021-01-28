require 'pry'
class Node
    def initialize(value)
      @self_value = value
    end
  
    def value
      return @self_value
    end
  
    def left_child
      return @left_child
    end
  
    def left_child=(node)
      @left_child = node
    end
  
    def right_child
      return @right_child
    end
  
    def right_child=(node)
      @right_child = node
    end

    def to_s
      value
    end
end
  
class Tree

    def initialize(node)
        @root = node
    end

    def add_node(node)
        return @root = node if @root.nil? 
        insert_below(@root, node)
    end

    def insert_below(existing_node, new_node)
        if existing_node.value >= new_node.value
        return existing_node.left_child = new_node if existing_node.left_child.nil?
        insert_below(existing_node.left_child, new_node)
        else
        return existing_node.right_child = new_node if existing_node.right_child.nil?
        insert_below(existing_node.right_child, new_node)
        end
    end

    def print_tree_in_order
        print_subtree_in_order(@root)
    end

    def print_subtree_in_order(current_node)
        puts " current node is: #{current_node.value}, left child is #{current_node.left_child.value unless current_node.left_child.nil?}, right child is #{current_node.right_child.value unless current_node.right_child.nil?}."
        tree_values = []
        tree_values << print_subtree_in_order(current_node.left_child) if !current_node.left_child.nil?
        tree_values << current_node.value
        tree_values << print_subtree_in_order(current_node.right_child) if !current_node.right_child.nil?
        return tree_values
    end

    def bfs
      node = @root
      queue = [node]
      print queue.last.value
      queue.unshift(@root.left_child) unless queue.last.left_child.nil?
      queue.unshift(@root.right_child) unless queue.last.right_child.nil?
      queue.pop
      until queue.empty?
        print " #{queue.last.value}"
        queue.unshift(queue.last.left_child) unless queue.last.left_child.nil?
        queue.unshift(queue.last.right_child) unless queue.last.right_child.nil?
        queue.pop
      end
    end
end

tree = Tree.new(Node.new(6))
tree.add_node(Node.new(5))
tree.add_node(Node.new(7))
tree.add_node(Node.new(9))
tree.add_node(Node.new(1))
tree.add_node(Node.new(15))
tree.add_node(Node.new(0))
tree.add_node(Node.new(2))
tree.add_node(Node.new(8))
puts tree.print_tree_in_order
tree.bfs