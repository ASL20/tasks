require 'minitest/autorun'

def uniq(array)
  return unless array.is_a?(Array)

  result = []
  array.each { |n| result << n unless result.include?(n) }
  result
end

class Test < Minitest::Test
  def test_uniq_correct_work
    assert_equal([1, 2, 5, 4], uniq([1, 1, 2, 2, 5, 4, 4]))
  end

  def test_uniq_blank_array
    assert_equal([], uniq([]))
  end

  def test_uniq_wrong_input
    assert_nil(uniq(1))
  end
end
