class Array
  def my_find
    n = 0
    result = nil
    while n < size
      result = self[n] if yield self[n]
      break if result
      n += 1
    end
    result
  end
end


[1, 3, 5, 7, 9].my_find { |x| x.is_a?(String) }

