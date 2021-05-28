[100, 1000, 5000].each do |number|
  number.times do
    arr = (1..number).to_a.shuffle
    file = File.new("#{number}.txt", 'w')
    arr.each do |num|
      file.puts num
    end
    file.close
  end
end
