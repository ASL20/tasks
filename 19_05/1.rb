class Array
  def my_each
    n = 0
    while n < size
      yield self[n]
      n += 1
    end
    self
  end
end


[1,2,3].my_each { |x| puts x + 1}
