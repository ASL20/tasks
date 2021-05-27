readed_file = File.open('text.txt', 'r') { |f| f.readlines }

result_arr = []
readed_file.each do |string|
  string.split(/\W* \(*/).each do |word|
    result_arr << word.chomp if word.length >= 2
  end
end

puts "Количество слов в файле #{result_arr.length}"
new_file = File.open('result.txt', 'w') do |f|
  result_arr.tally.each do |key, value|
    f.puts "#{key} => #{value}"
  end
end
