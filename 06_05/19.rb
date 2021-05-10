require 'minitest/autorun'

def palindrome?(word)
  word = word.downcase.chomp

  index = 0
  count = -1
  result = ""

  while index < word.size
    result += word[count]
    index += 1
    count -= 1
  end

  if result == word
    'Это палиндром'
  else
    'Это не палиндром'
  end
end

class Test < Minitest::Test
  def test_palindrome
    input = "мадам"
    assert_equal("Это палиндром", palindrome?(input))
  end
  def test_not_palindrome
    input = "мадемуазель"
    assert_equal("Это не палиндром", palindrome?(input))
  end
  def test_wrong_input
    input = 515
    assert_raises(NoMethodError) { palindrome?(input) }
  end
end
