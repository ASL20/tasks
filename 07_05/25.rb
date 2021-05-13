require 'minitest/autorun'

def compact(array)
  return unless array.is_a?(Array)

  result = []
  array.each { |n| result << n if n }
  result
end

class Test < Minitest::Test
  def test_compact_correct_work
    assert_equal([1, 2, 3], compact([1, nil, 2, nil, nil, 3]))
  end

  def test_compact_only_nil
    assert_equal([], compact([nil, nil]))
  end

  def test_compact_wrong_input
    assert_nil(compact(1))
  end
end
