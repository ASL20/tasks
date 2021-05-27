file = File.open('fruits.txt', 'r') { |f| f.readlines }
new_file = File.open('new_fruits.txt', 'w') do |f|
  file.reverse.each { |string| string.include?('-') ? f.puts('**********') : f.puts(string) }
end
