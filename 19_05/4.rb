class Array
  def my_count(arg = nil)
    count = 0
    result = nil
    if arg
      n = 0
      while n < size
        count += 1 if self[n] == arg
        n += 1
      end
      count
    else
      n = 0
      while n < size
        count += 1 if yield self[n]
        n += 1
      end
      count
    end
  end
end


puts [1, 2, 3, 3, 4, 5, 7].my_count { |x| x % 3 == 0}

