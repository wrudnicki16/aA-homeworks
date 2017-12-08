class Queue
  def initialize(array = [])
    @queue = array
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.pop
  end

  def show
    @queue.dup
  end
end
