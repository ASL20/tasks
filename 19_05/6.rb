class Array
  def my_reject
    result = []
    n = 0
    while n < size
      result << self[n] unless yield self[n]
      n += 1
    end
    result
  end
end


puts [1, 2, 3, 4, 5, 6, 7, 8, 9].my_reject { |x| x % 3 == 0}

