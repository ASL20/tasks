require 'minitest/autorun'

def string_reverse(string)
  normalize_string = []
  index = 0

  while index < string.length
    normalize_string << string[index]
    index +=1
  end

  reverse_string = ""
  index = -1

  normalize_string.each do |letter|
    reverse_string << normalize_string[index]
    index -= 1
  end
  reverse_string
end

class Test < Minitest::Test
  def test_correct_input
    input = "слово"
    assert_equal("оволс", string_reverse(input))
  end
  def test_blank_array
    input = []
    assert_equal("", string_reverse(input))
  end
end
