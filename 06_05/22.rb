def sum(array)
  sum = 0
  array.each do |num|
    sum += num
  end
  sum
end

def sum(array)
  sum = 0
  index = 0
  while index < array.length
    sum += array[index]
    index += 1
  end
  sum
end
