require 'minitest/autorun'
require 'byebug'

def move_zeroes(array)
  result = []
  tmp_value = nil
  rev_index = -1
  array.each_with_index do |element, index|
    if element == 0
      while (-array.length + index) != rev_index
        if array[rev_index] != element
          tmp_value = array[rev_index]
          array[rev_index] = 0
          break
        end
        rev_index -= 1
      end
      array[index] = tmp_value
    end
    break if (-array.length + index) == rev_index
  end
  array
end

# p move_zeroes([0, 2, 5, 7, 0, 0, 4, 0, 7, -5, 8, 0])
# p move_zeroes([2, 5, 7, 0, 4, 0, 7, -5, 8, 0])


class Test < Minitest::Test
  def test_move_zeroez_correct_work
    assert_equal([8, 2, 5, 7, -5, 7, 0, 0, 0, 0], move_zeroes([0, 2, 5, 7, 0, 4, 0, 7, -5, 8, 0]))
  end
end
