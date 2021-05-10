require 'minitest/autorun'

def make_month(count, first_day)
  week = %w[ понедельник вторник среда четверг пятница суббота воскресенье ]
  result = []

  # находим индекс нужного дня
  day_index = nil
  index = 0
  while index < week.length
    day_index = index if first_day == week[index]
    break if day_index == index
    index += 1
  end

  part1 = []
  part2 = []

  # собираем часть недели до индекса
  index = 0
  while index < day_index
    part1 << week[index] if index != day_index
    index += 1
  end

  # собираем часть недели с индекса до конца
  index = day_index
  while index < week.length
    part2 << week[index]
    index += 1
  end

  # собираем неделю, начинающуюся с необходимого дня
  actual_week = part2 + part1

  # собираем дни по числам, каждые 7 дней счетчик недели сбрасывается
  index = 0
  day_counter = 0
  while index < count
    result << "#{actual_week[day_counter]}"
    day_counter += 1
    index += 1
    if index % 7 == 0
      day_counter = 0
    end
  end
  result
end

def month_of_year(month, number)
  months = %w[январь февраль март апрель май июнь июль август сентябрь октябрь ноябрь декабрь]
  week = %w[ понедельник вторник среда четверг пятница суббота воскресенье ]
  days_in_months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  first_day = 'пятница'

  # собираем все месяца по дням в общий массив
  index = 0
  full_months =
    days_in_months.map do |element|
      # собираем дни месяца в массив
      collected_month = make_month(element, first_day)

      # находим следующий день после конца месяца
      counter = 0
      while counter < week.length
        next_of_last_day = week[counter] if collected_month[-1] == week[counter - 1]
        counter += 1
      end

      # назначаем день нового месяца следующим за последним днем прошлого месяца
      first_day = next_of_last_day
      index += 1
      collected_month
    end

  # находим нужный месяц
  index = 0
  required_month = nil
  full_months.each do |element|
    required_month = element if month == months[index]
    index += 1
  end

  # находим нужный день
  index = 0
  required_day = nil
  required_month.each do |element|
    required_day = element if (index + 1) == number
    index += 1
  end
  required_day
end

puts month_of_year('май', 10)

class Test < Minitest::Test
  def test_make_month_correct_work
    arr = [
      "суббота",
      "воскресенье",
      "понедельник",
      "вторник",
      "среда",
      "четверг",
      "пятница",
      "суббота",
      "воскресенье",
      "понедельник",
      "вторник",
      "среда",
      "четверг",
      "пятница",
      "суббота",
      "воскресенье",
      "понедельник",
      "вторник",
      "среда",
      "четверг",
      "пятница",
      "суббота",
      "воскресенье",
      "понедельник",
      "вторник",
      "среда",
      "четверг",
      "пятница",
      "суббота",
      "воскресенье",
      "понедельник"
    ]
    assert_equal(arr, make_month(31, 'суббота'))
  end

  def test_month_of_year_correct_work
    assert_equal("понедельник", month_of_year("май", 10))
  end

  def test_month_of_year_wrong_month
    assert_raises(NoMethodError) { month_of_year("месяц", 10) }
  end

  def test_month_of_year_wrong_number
    assert_nil(month_of_year("май", 50))
  end
end
