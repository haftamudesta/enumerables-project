require_relative 'my_enumerable'

class MyList
  include MyEnumerable

  def initialize(*elements)
    @list = elements
  end

  def each(&block)
    return enum_for(:each) unless block_given?

    @list.each(&block)
  end
end

# Create our list
list = MyList.new(1, 2, 3, 4)

# Test #all?
p(list.all? { |e| e < 5 })
p(list.all? { |e| e > 5 })

# Test #any?
p(list.any? { |e| e == 2 })
p(list.any? { |e| e == 5 })

# Test #filter
p list.filter(&:even?)
