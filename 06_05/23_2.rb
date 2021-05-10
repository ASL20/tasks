require 'minitest/autorun'

def stars_while(quantity)
  index = 0
  result = []
  while index <= quantity
    count = 1
    numbers = ""
    string = (" " * (quantity - index))
    while count <= index
      print string + "#{count} "
      # numbers + (string + "#{count} ")
      count += 1
    end
    result << numbers
    index += 1
  end
  result
end

puts stars_while(7)


# def stars_each(quantity)
# index = 0

# arr.each do |num|
#   count = 0
#   print " " * ((arr[-num]) - 1)
#   while count <= index
#     print "#{arr[count]} "
#     count += 1
#   end
#   puts
#   index += 1
# end
