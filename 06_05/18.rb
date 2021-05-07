require 'minitest/autorun'

def string_reverse(string)
  index = 0
  count = -1
  new_string = ""
  while index < string.length
    new_string << string[count]
    index += 1
    count -= 1
  end
  new_string
end

class Test < Minitest::Test
  def test_integer
    input = 56
    assert_raises(NoMethodError) { string_reverse(input) }
  end
  def test_correct_array
    input = %w[ с л о в о ]
    assert_equal("оволс", string_reverse(input))
  end
  def test_correct_string
    input = "слово"
    assert_equal("оволс", string_reverse(input))
  end
  def test_blank_array
    input = []
    assert_equal("", string_reverse(input))
  end
  def test_blank_string
    input = ""
    assert_equal("", string_reverse(input))
  end
end
