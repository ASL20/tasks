week = %w[ Mon Tue Wed Thu Fri Sat Sun ]

(1..12).to_a.each do |month|
  file = File.open("calendar/#{month}.txt", 'w') do |f|
    f.puts "#{Time.new(2021, month).strftime('%B')}\n#{"-"*27}\n"

    week.each_with_index do |day_of_week, index|
      f.print "#{day_of_week} "
      f.puts if week.length - index == 1
    end

    first_day = Time.new(2021, month, 1)
    week_index = week.index(first_day.strftime('%a'))

    n = 1
    string = ""
    while n - 1 < week_index
      string << "    "
      n += 1
    end
    f.print string

    string = ""
    (1..31).to_a.each do |day|
      date = Time.new(2021, month, day)
      break if date.month != month
      f.print "#{date.strftime('%e')}  "
      if n % 7 == 0
        f.puts
      end
      n += 1
    end
    f.puts
  end
end
