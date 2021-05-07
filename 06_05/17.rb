def look_matches(array, input)
  result = []
  array.each do |word|
    result << word if word[0] == input
  end

  if result.length == 0
    'Слов начинающихся на эту букву нет'
  else
    result
  end
end

arr = %w{ apple banana qiwi baseball antanta query queue balls alladin }

puts 'Введите букву'
input = STDIN.gets.strip.downcase

puts look_matches(arr, input)
