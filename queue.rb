class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

class Queue
  def initialize
    @first = nil
    @last = nil
  end

  def enqueue(value)
    # puts in back
    node = LinkedListNode.new(value)
    if @last == nil
      @first = @last = node
    else
      @last.next_node = node
      @last = node
    end
  end

  def dequeue
    # takes one out in front
    if @first
      value = @first.value
      @first = @first.next_node
      value
    else
      nil
    end
  end
end