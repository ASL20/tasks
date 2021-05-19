class Array
  def my_select
    result = []
    n = 0
    while n < size
      result << self[n] if yield self[n]
      n += 1
    end
    result
  end
end


puts [1, 2, 3, 4, 5, 6, 7, 8, 9].my_select { |x| x % 3 == 0}

