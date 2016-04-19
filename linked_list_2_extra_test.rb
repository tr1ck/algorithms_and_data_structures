require 'minitest/autorun'
require './linked_list_2_extra'

describe LinkedListNode do
  before do
    @node1 = LinkedListNode.new(1)
    @node2 = LinkedListNode.new(2, @node1)
    @node3 = LinkedListNode.new(3, @node2)
  end

  describe 'finding an infinite loop in linked list' do
    it 'returns true for infinite loop' do
      @node1.next_node = @node3
      
      infinite_linked_list?(@node3).must_equal(true)
    end
  end

  describe 'finding a finite loop in linked list' do
    it 'returns false for finite loop' do
      infinite_linked_list?(@node3).must_equal(false)
    end
  end
end