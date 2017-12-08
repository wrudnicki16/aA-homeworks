class Stack
  def initialize(array = [])
    @stack = array
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end
