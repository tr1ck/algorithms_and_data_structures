require 'minitest/autorun'
require './queue'

describe Queue do
  before do
    @queue = Queue.new
  end

  describe 'empty queue' do
    it 'returns nil because queue is empty' do
      @queue.dequeue.must_be_nil
    end
  end

  describe 'adding and removing elements' do
    it 'returns first item added to list' do
      @queue.enqueue(1)
      @queue.enqueue(2)
      @queue.enqueue(3)
      @queue.dequeue.must_equal(1)
      @queue.dequeue.must_equal(2)
      @queue.dequeue.must_equal(3)
      @queue.dequeue.must_be_nil
    end
  end

end
