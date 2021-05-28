readed_file = File.open('text.txt', 'r') { |f| f.readlines }

result_arr = []
readed_file.each do |string|
  string.split(' ').each do |word|
    normalize_word = ""
    word.chars.each do |letter|
      if letter =~ /[A-Z]/ || letter =~ /[a-z]/
        normalize_word << letter
      end
    end
    result_arr << normalize_word.chomp if normalize_word.length >= 2
  end
end

puts "Количество слов в файле #{result_arr.length}"
result_hash = {}
result_arr.each do |word|
  if result_hash[word]
    result_hash[word] += 1
  else
    result_hash[word] = 1
  end
end

new_file = File.open('result.txt', 'w') do |f|
  result_hash.each do |key, value|
    f.puts "#{key} => #{value}"
  end
end
