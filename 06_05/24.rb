require 'byebug'
arr = [1, 2, 3, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 4, 5, 5, 5, 5, 5, 5, 6, 5, 5]

index = 0

accum1 = [arr[0]]
accum2 = []

current_counter = 0
last_counter = 0

last_number = arr[0]

while index <= arr.length
  current_number = arr[index]
  if last_number == current_number
    current_counter += 1
    number = current_number
  else
    if current_counter > last_counter
      last_counter = current_counter
      last_number = number
      number = arr[index]
    else
      last_number = number
    end
  end

  index += 1
end

puts last_counter
puts number
