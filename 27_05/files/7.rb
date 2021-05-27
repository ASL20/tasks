(1..12).to_a.each do |month|
  file = File.open("months/#{month}.txt", 'w') do |f|
    f.puts "#{Time.new(2021, month).strftime('%B')}\n**********\n"
    (1..31).to_a.each do |day|
      date = Time.new(2021, month, day)
      break if date.month != month
      f.puts "#{date.strftime('%e - %A')}"
    end
  end
end
