arr = %w{ apple banana qiwi baseball antanta query queue balls alladin }

puts 'Введите букву'
input = STDIN.gets.strip.downcase

arr.each do |word|
  if word[0] == input
    puts word
  else
    puts 'Слов начинающихся с той буквы нет'
  end
end
