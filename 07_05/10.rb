require 'minitest/autorun'

def month(count, first_day)
  week = %w[ понедельник вторник среда четверг пятница суббота воскресенье ]
  result = []

  # находим индекс нужного дня
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
    result << "#{index + 1} #{actual_week[day_counter]}"
    day_counter += 1
    index += 1
    if index % 7 == 0
      day_counter = 0
    end
  end
  result
end

class Test < Minitest::Test
  def test_month_correct_work
    arr = [
      "1 суббота",
      "2 воскресенье",
      "3 понедельник",
      "4 вторник",
      "5 среда",
      "6 четверг",
      "7 пятница",
      "8 суббота",
      "9 воскресенье",
      "10 понедельник",
      "11 вторник",
      "12 среда",
      "13 четверг",
      "14 пятница",
      "15 суббота",
      "16 воскресенье",
      "17 понедельник",
      "18 вторник",
      "19 среда",
      "20 четверг",
      "21 пятница",
      "22 суббота",
      "23 воскресенье",
      "24 понедельник",
      "25 вторник",
      "26 среда",
      "27 четверг",
      "28 пятница",
      "29 суббота",
      "30 воскресенье",
      "31 понедельник"
    ]
    assert_equal(arr, month(31, 'суббота'))
  end

  def test_month_wrong_input
    assert_raises(ArgumentError) { month('суббота', 31) }
  end
end
