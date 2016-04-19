require 'minitest/autorun'
require './linked_list_1'

describe Stack do
  before do
    @stack = Stack.new
  end

  describe 'empty stack' do
    it 'pop returns nil because stack is empty' do
      @stack.pop.must_be_nil
    end
  end

  describe 'adding elements to stack' do
    it 'returns elements in reverse order of linked list' do
      @stack.push(1)
      @stack.push(2)
      @stack.push(3)
      @stack.pop.must_equal(3)
      @stack.pop.must_equal(2)
      @stack.pop.must_equal(1)
      @stack.pop.must_equal(nil)
    end
  end
end