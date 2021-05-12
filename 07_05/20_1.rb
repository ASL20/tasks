require 'minitest/autorun'

def filter(array, operator, object)
  return unless array.is_a?(Array) || (array.is_a?(Array) && array.any?) || (operator == '<' || operator == '>')

  mapped_array =
    array.map do |n|
      case operator
      when '<'
        n if n < object
      when '>'
        n if n > object
      end
    end

  result = []
  mapped_array.each do |n|
    result << n unless n.nil?
  end
  result
end

class Test < Minitest::Test
  def setup
    @array = [1, 2, 3, 2]
  end

  def test_filter_there_is_bigger
    assert_equal([1], filter(@array, '<', 2))
  end

  def test_filter_there_is_less
    assert_equal([3], filter(@array, '>', 2))
  end

  def test_filter_there_is_no_matches
    assert_equal([], filter(@array, '>', 5))
  end

  def test_find_index_wrong_input
    assert_nil(filter(2, 4, 5))
  end
end
