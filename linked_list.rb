# frozen_string_literal: true

# class Node
class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

# class LinkedList
class LinkedList
  attr_accessor :size, :head, :tail
  def initialize
    @head = Node.new
    @tail = head
    @size = 0
  end

  def append(value)
    if head == tail && head.value == nil
      head.value = value
    else
      tail.next_node = Node.new(value)
      self.tail = tail.next_node
    end
    self.size += 1
  end

  def to_s
    node = head
    size.times do
      print "(#{node.value}) -> "
      node = node.next_node
    end
  end
end

list = LinkedList.new
list.append(5)
list.append(4)
list.append(3)
list.append(2)
puts list
