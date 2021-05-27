file = File.new('1.txt', 'w')

(1..100).to_a.each do |num|
  file.puts num
end

file.close
