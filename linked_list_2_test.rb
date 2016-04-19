require 'minitest/autorun'
require './linked_list_2'

describe LinkedListNode do
  before do
    @node1 = LinkedListNode.new(1)
    @node2 = LinkedListNode.new(2, @node1)
    @node3 = LinkedListNode.new(3, @node2)
    @test_node1 = LinkedListNode.new(3)
    @test_node2 = LinkedListNode.new(2, @test_node1)
    @test_node3 = LinkedListNode.new(1, @test_node2)
  end

  describe 'adding values to linked list' do
    it 'returns linked list in reverse order' do
      print_values(reverse_list(@node3)).must_equal(print_values(@test_node3))
    end
  end
end