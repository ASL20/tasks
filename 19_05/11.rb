def select_color(number)
  if number.zero?
    [number]
  elsif ((number.between?(1, 10) || number.between?(19, 28)) && number.odd?) ||
    ((number.between?(11, 18) || number.between?(29, 36)) && number.even?)
    [number, "red"]
  else
    [number, "black"]
  end
end

def select_number(roulette_numbers)
  roulette_numbers.sample
end

