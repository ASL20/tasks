require 'minitest/autorun'

def sum_each(array)
  sum = 0
  array.each do |num|
    sum += num
  end
  sum
end

def sum_while(array)
  sum = 0
  index = 0
  while index < array.length
    sum += array[index]
    index += 1
  end
  sum
end

class Test < Minitest::Test
  def test_sum_each_correct_work
    result = 10
    assert_equal(result, sum_each([1, 2, 3, 4]))
  end

  def test_sum_while_correct_work
    result = 10
    assert_equal(result, sum_while([1, 2, 3, 4]))
  end

  def test_sum_each_wrong_input
    assert_raises(NoMethodError) { sum_each('Привет') }
  end

  def test_sum_while_wrong_input
    assert_raises(TypeError) { sum_while('Привет') }
  end
end
