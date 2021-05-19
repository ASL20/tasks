class Array
  def my_map
    n = 0
    while n < size
      self[n] = yield self[n]
      n += 1
    end
    self
  end
end


arr = [1,2,3].my_map { |x| x + 1}
print arr
