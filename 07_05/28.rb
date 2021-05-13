require 'minitest/autorun'

def split(arr, condition)
  return arr.map { |n| [n] } if condition == ''

  result = []
  tmp = []
  arr.each do |n|
    tmp << n if n != condition
    if n == condition || n == arr.last
      result << tmp
      tmp = []
    end
  end
  result
end

class Test < Minitest::Test
  def test_split_if_condition_is_blank_string
    assert_equal([[1], [2], [3]], split([1, 2, 3], ""))
  end

  def test_split_if_condition_is_number
    assert_equal([[1, 2], [2, 3], [3, 5]], split([1, 2, 4, 2, 3, 4, 3, 5], 4))
  end
end
