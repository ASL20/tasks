require 'minitest/autorun'

def move_zeroes(arr)
  tmp_value = 0
  arr.each_with_index do |n, index|
    i = -1
    if n == 0
      while i >= -arr.length
        if arr[i] != 0
          tmp_value = arr[i]
          arr[i] = 0
          break
        end
      i -= 1
      end
      arr[index] = tmp_value
    elsif n == 0
      return arr
    end
  end
end

class Test < Minitest::Test
  def test_move_zeroez_correct_work
    assert_equal([0, 2, 5, 7, 8, 4, -5, 7, 0, 0, 0], move_zeroes([0, 2, 5, 7, 0, 4, 0, 7, -5, 8, 0]))
  end
end
