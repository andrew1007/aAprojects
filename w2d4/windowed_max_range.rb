def naive_max_range(arr, win)
  max_range = []
  arr.each_cons(win) { |window| max_range << window }
  max_range.max_by { |r| r.max - r.min }
end

def optimized_max_range(arr, win)

end

class MyQueue
  def initialize
    @store = []
  end

  def enqueue(val)
    @store.push(val)
  end

  def dequeue
    @store.shift
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end

  def peek
    @store.first
  end
end

class MyStack
  def initialize
    @store = []
  end

  def push(val)
    @store.push(val)
  end

  def pop
    @store.pop
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end

  def peek
    @store.last
  end
end

class MyStackQueue
  def initialize
    @store_1 = MyStack.new
    @store_2 = Mystack.new
  end

  def enqueue(val)
    @store_1.push(val)
  end

  def dequeue
    all_but_one = @store_1.size - 1
    all_but_one.times { @store_2.push(store_1.pop) }
    @store_1.pop
    all_but_one.times { @store_1.push(@store_2.pop) }
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end

  def peek
    @store.first
  end
end

if __FILE__ == $PROGRAM_NAME
  a = [1, 3, 2, 5, 4, 8]
  p naive_max_range(a, 4)
end
