require 'minitest/autorun'

def each_fizzbuzz(arr)
  result = []
  arr.each do |num|
    if num % 15 == 0
      result <<'FizzBuzz'
    elsif num % 3 == 0
      result <<'Fizz'
    elsif num % 5 == 0
      result <<'Buzz'
    else
      result << num
    end
  end
  result
end

def while_fizzbuzz
  result = []

  number = 1

  while number <= 15
    if number % 15 == 0
      result << 'FizzBuzz'
    elsif number % 3 == 0
      result << 'Fizz'
    elsif number % 5 == 0
      result << 'Buzz'
    else
      result << number
    end
    number += 1
  end
  result
end

class Test < Minitest::Test
  def test_each_fizzbuzz_wrong_input
    wrong_input = 'Хай'
    assert_raises(NoMethodError) { each_fizzbuzz(wrong_input) }
  end

  def test_each_fizbuzz_correct_input
    correct_input = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
    result = [1, 2, 'Fizz', 4, 'Buzz', 'Fizz', 7, 8, 'Fizz', 'Buzz', 11, 'Fizz', 13, 14, 'FizzBuzz']
    assert_equal(result, each_fizzbuzz(correct_input))
  end

  def test_while_fizbuzz_correct_work
    result = [1, 2, 'Fizz', 4, 'Buzz', 'Fizz', 7, 8, 'Fizz', 'Buzz', 11, 'Fizz', 13, 14, 'FizzBuzz']
    assert_equal(result, while_fizzbuzz)
  end
end

