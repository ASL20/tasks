number = 5
index = 1

while index <= number
  print " " * (number - index)
  puts "* " * index
  index += 1
end

arr = [1, 2, 3, 4, 5]

index = 1

arr.each do |num|
  print " " * ((arr[-num]) - 1)
  puts "* " * index
  index += 1
end

index = 0

while index < arr.size
  count = 0
  print " " * (arr.size - 1 - index)
  while count <= index
    print "#{arr[count]} "
    count += 1
  end
  puts

  index += 1
end

index = 0

arr.each do |num|
  count = 0
  print " " * ((arr[-num]) - 1)
  while count <= index
    print "#{arr[count]} "
    count += 1
  end
  puts
  index += 1
end
