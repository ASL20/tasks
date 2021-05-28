require 'minitest/autorun'
require_relative 'bubble'

class Test < Minitest::Test
  def test_bubble_sort_correct_work
    arr = [5, 4, 1, 3, 2, 7, 9, 6, 8, 10]
    result = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    assert_equal(result, bubble_sort(arr))
  end

  def test_bubble_sort_letters_correct_work
    arr = %w[ a s d f g h ]
    result = %w[ a d f g h s ]
    assert_equal(result, bubble_sort(arr))
  end

  def test_bubble_sort_wrong_input
    assert_raises(NoMethodError) { bubble_sort(1) }
  end
end
