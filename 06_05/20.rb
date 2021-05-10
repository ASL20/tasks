require 'minitest/autorun'

def numbers_each(arr)
  result = []
  arr.each do |num|
    if num > 0
      result << "#{num} - this number is positive"
    elsif num < 0
      result << "#{num} - this number is negative"
    elsif num == 0
      result << "#{num} - this number is zero"
    end
  end
  result
end

def numbers_while(arr)
  result = []
  index = 0

  while index < arr.length
    if arr[index] > 0
      result << "#{arr[index]} - this number is positive"
    elsif arr[index] < 0
      result << "#{arr[index]} - this number is negative"
    elsif arr[index] == 0
      result << "#{arr[index]} - this number is zero"
    end
    index += 1
  end
  result
end

class Test < Minitest::Test
  def test_numbers_each_correct_work
    correct_input = [-1, 0, 1]
    result = ["-1 - this number is negative", "0 - this number is zero", "1 - this number is positive"]
    assert_equal(result, numbers_each(correct_input))
  end

  def test_numbers_while_correct_work
    correct_input = [-1, 0, 1]
    result = ["-1 - this number is negative", "0 - this number is zero", "1 - this number is positive"]
    assert_equal(result, numbers_while(correct_input))
  end
end
