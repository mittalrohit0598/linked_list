# frozen_string_literal: true

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

  def insert_at(value, index)
    node = head
    (index - 1).times do
      node = node.next_node
    end
    new_node = Node.new(value, node.next_node)
    node.next_node = new_node
    self.size += 1
  end

  def remove_at(index)
    node = head
    (index - 1).times do
      node = node.next_node
    end
    node.next_node = node.next_node.next_node
    self.size -= 1
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
