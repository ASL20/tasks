file = File.new('1.txt', 'a')

(100..200).to_a.each do |num|
  file.puts num if num.even?
end

file.close
