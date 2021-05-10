require 'minitest/autorun'

def include?(array, object)
  result = false
  array.map do |el|
    result = true if el == object
  end
  result
end


class Test < Minitest::Test
  def test_include_there_is_match
    assert_equal(true, include?([1, 2, 3], 2))
  end

    def test_include_there_is_not_match
    assert_equal(true, include?([1, 2, 3], 2))
  end
end
