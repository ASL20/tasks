require 'minitest/autorun'

def min_2(array)
  return if array.length == 0

  min1 = 0
  min2 = 0

  index = 0
  previous_value = 0
  array.each do |num|
    previous_value = min1
    min1 = num if num > previous_value
    index += 1
  end

  index = 0
  previous_value = 0
  array.each do |num|
    previous_value = min2
    min2 = num if num > previous_value
    index += 1
  end

  index = 0
  previous_value = 0
  array.each do |num|
    previous_value = min1
    min1 = num if num < previous_value
    index += 1
  end

  index = 0
  previous_value = 0
  array.each do |num|
    previous_value = min2
    min2 = num if num > min1 && num < previous_value
    index += 1
  end
  [min1, min2]
end

class Test < Minitest::Test
  def test_min_2_correct_work
    assert_equal([-2, 1], min_2([1, -2, 1, 2, 3]))
  end

  def test_min_2_blank_array
    assert_nil(min_2([]))
  end
end
