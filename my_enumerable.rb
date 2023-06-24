module MyEnumerable
  def all?(&block)
    each { |element| return false unless block.call(element) }
    true
  end

  def any?(&block)
    each { |element| return true if block.call(element) }
    false
  end

  def filter(&block)
    result = []
    each { |element| result << element if block.call(element) }
    result
  end
end

# Create our list
list = MyList.new(1, 2, 3, 4)

# Test #all?
list.all? { |e| e < 5 }
list.all? { |e| e > 5 }

# Test #any?
list.any? { |e| e == 2 }
list.any? { |e| e == 5 }

# Test #filter
p list.filter(&:even?)
