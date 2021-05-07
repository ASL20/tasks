require_relative 'test_helper'
require '17'

class Find < Minitest::Test
  def look_matches
    arr= ['apple', 'banana', 'age', 'house', 'horse', 'book']
    assert_equal(arr, a)
  end
end
