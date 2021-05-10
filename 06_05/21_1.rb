require 'minitest/autorun'

def range(num1, num2)
  return if num1 == num2
  arr = []

  if num1 < num2
    while num1 <= num2
      arr << num1
      num1 += 1
    end
  else
    while num1 >= num2
      arr << num1
      num1 -= 1
    end
  end

  result = []

  arr.each { |num| result << num }
  result
end

class Test < Minitest::Test
  def test_range_correct_work_asc
    result = [-1, 0, 1, 2]
    assert_equal(result, range(-1, 2))
  end

  def test_range_correct_work_desc
    result = [2, 1, 0, -1]
    assert_equal(result, range(2, -1))
  end

  def test_range_wrong_input
    assert_raises(TypeError) { range('a', 'b') }
  end

  def test_numbers_is_equal
    correct_input = [-1, 0, 1]
    assert_nil(range(1, 1))
  end
end
