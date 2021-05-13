require 'minitest/autorun'

def rotate(array, number, param)
  return unless array.is_a?(Array) || number.is_a?(Integer) || (param == '>' || param == '<')

  result =
    case param
    when '<'
      part1 = array.map.with_index { |n, index| n if index >= array.length - number}.compact
      part2 = array.map.with_index { |n, index| n if index < array.length - number }.compact
      part1 + part2
    when '>'
      part1 = array.map.with_index { |n, index| n if index < number }.compact
      part2 = array.map.with_index { |n, index| n if index >= number }.compact
      part2 + part1
    end
  result
end

class Test < Minitest::Test
  def test_rotate_right
    assert_equal([12, 14, 18, 20, 22, 25, 27, 0, 3, 6, 9], rotate([0, 3, 6, 9, 12, 14, 18, 20, 22, 25, 27], 4, '>'))
  end

  def test_rotate_left
    assert_equal([25, 27, 28, 0, 3, 6, 9, 12, 14, 18, 20, 22], rotate([0, 3, 6, 9, 12, 14, 18, 20, 22, 25, 27, 28], 3, '<'))
  end

  def test_rotate_wrong_input
    assert_nil(rotate(1, [], '='))
  end
end
