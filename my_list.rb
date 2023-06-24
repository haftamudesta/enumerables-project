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
