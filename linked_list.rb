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
    if head == tail && head.value.nil?
      head.value = value
    else
      tail.next_node = Node.new(value)
      self.tail = tail.next_node
    end
    self.size += 1
  end

  def prepend(value)
    if head == tail && head.value.nil?
      head.value = value
    else
      self.head = Node.new(value, head)
    end
    self.size += 1
  end

  def at(index)
    node = head
    index.times do
      node = node.next_node
    end
    node.value
  end

  def pop
    if head == tail
      head.value = nil
    else
      node = head
      (size - 1).times { node = node.next_node }
      tail = node
      tail.next_node = nil
    end
    self.size -= 1
  end

  def contains?(value)
    to_s.include?(value.to_s)
  end

  def find(value)
    list = to_s
    list.gsub('(', '').gsub(')', '').split(' -> ').find_index(value.to_s)
  end

  def to_s
    node = head
    list = ''
    size.times do
      list += "(#{node.value}) -> "
      node = node.next_node
    end
    list += 'nil'
    list
  end
end

list = LinkedList.new
list.append(5)
list.append(4)
list.append(3)
list.append(2)
list.prepend(6)
list.prepend(7)
list.prepend(8)
list.prepend(9)
puts list
list.pop
list.pop
list.pop
puts list
puts list.contains?(10)
puts list.contains?(5)
puts list.find(8)
puts list.find(11)
