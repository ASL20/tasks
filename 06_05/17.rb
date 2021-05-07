require 'minitest/autorun'

def look_matches(array, input)
  result = []
  array.each do |word|
    result << word if word[0] == input
  end

  if result.length == 0
    'Слов начинающихся на эту букву нет'
  else
    result
  end
end

class Test < Minitest::Test
  def test_correct_input
    arr = ['apple', 'banana', 'age', 'house', 'horse', 'book']
    input = 'a'
    assert_equal(['apple', 'age'], look_matches(arr, input))
  end

  def test_uncorrect_input
    arr = ['apple', 'banana', 'age', 'house', 'horse', 'book']
    input = 1
    assert_equal('Слов начинающихся на эту букву нет', look_matches(arr, input))
  end

  def test_blank_array
    input = 'a'
    assert_equal('Слов начинающихся на эту букву нет', look_matches([], input))
  end
end
