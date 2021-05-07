arr = [1, 2, 3, 4, 5]
index = 0

while index < arr.size
  count = 0
  while count <= index
    print "#{arr[count]} "
    count += 1
  end
  puts

  index += 1
end

index = 0

until index == arr.size
  count = 0
  until count > index
    print "#{arr[count]} "
    count += 1
  end
  puts

  index += 1
end

for num in arr
  count = 1
  while count <= num
    print "#{count} "
    count += 1
  end
  puts
end

arr.each do |num|
  count = 1
  while count <= num
    print "#{count} "
    count += 1
  end
  puts
end
