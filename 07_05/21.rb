require 'minitest/autorun'

def flatten(array)
  return unless array.is_a?(Array)
  result = []
  array.each do |n|
    if n.is_a?(Array)
      n.each { |n| result << n }
    else
      result << n
    end
  end
  result
end


class Test < Minitest::Test
  def test_flatten_correct_work
    assert_equal(['a', 'b', 'c', 'd'], flatten([['a'], 'b', ['c', 'd']]))
  end

  def test_flatten_wrong_input
    assert_nil(flatten(6))
  end
end
