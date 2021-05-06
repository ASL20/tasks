def sum(array)
  sum = 0
  array.each do |num|
    sum += num
  end
  sum
end

puts sum([1, 12, 14])
