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

def infinite_linked_list?(start_node)
  tortoise = start_node
  hare = start_node
  loop do
    if hare.next_node == nil
      return false
    else
      hare = hare.next_node
    end

    if hare.next_node == nil
      return false
    else
      hare = hare.next_node
      tortoise = tortoise.next_node
    end

    if hare == tortoise
      return true
    end
  end
end
 
# node1 = LinkedListNode.new(37)
# node2 = LinkedListNode.new(99, node1)
# node3 = LinkedListNode.new(12, node2)
# node1.next_node = node3

# infinite_linked_list?(node3)
