require 'minitest/autorun'

def stars_while(quantity)
  index = 1
  result = []
  while index <= quantity
    result << "#{' ' * (quantity - index)}#{'* ' * index}"
    index += 1
  end
  result
end

def stars_each(quantity)
  count = 1
  arr = []
  while count <= quantity
    arr << count
    count += 1
  end

  index = 1
  result = []
  arr.each do |num|
    result << "#{" " * ((arr[-num]) - 1)}#{"* " * index}"
    index += 1
  end
  result
end
