arr = (1..5).to_a
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

  while count <= index
    print "#{arr[count]} "
    count += 1
  end
  puts

  index += 1
end
