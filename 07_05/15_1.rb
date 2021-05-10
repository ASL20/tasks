require 'minitest/autorun'

def reverse(array)
  return unless array.is_a?(Array)

  result = []
  index = -1
  result =
    array.map do |el|
      el = array[index]
      index -= 1
      el
    end
end

class Test < Minitest::Test
  def test_reverse_correct_work
    assert_equal([3, 2, 1], reverse([1, 2, 3]))
  end
  def test_reverse_blank_array
    assert_equal([], reverse([]))
  end
  def test_reverse_wrong_input
    assert_nil(reverse('array'))
  end
end
