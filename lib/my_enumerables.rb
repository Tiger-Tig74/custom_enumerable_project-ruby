module Enumerable
  def my_any?
    for element in self
      return true if yield(element)
    end
    false
  end
  def my_all?
    each { |element| return false unless yield(element)}
    true
  end
  def my_count
    count = 0
    return self.length if !block_given?
    each { |element| count += 1 if yield(element) }
    count
  end
  def my_each_with_index
    index = 0
    for element in self
      yield(element, index)
      index += 1
    end
    self
  end
  def my_inject(initial = nil)
    accumulator = initial.nil? ? first : initial
    each do |element|
      accumulator = yield(accumulator, element)
    end
    accumulator
  end
  def my_map
    result = []
    if block_given?
      each { |element| result << yield(element) }
    else
      to_enum(:my_map)
    end
    result
  end
  def my_none?
    for element in self
      return false if yield(element)
    end
    true
  end
  def my_select
    result = []
    if block_given?
      each { |element| result << element if yield(element) }
    end
    result
  end
end

class Array
  def my_each
    for element in self
      yield(element)
    end
    self
  end
end
