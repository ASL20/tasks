
require 'minitest/autorun'

def bomb_text(number)
  return unless number.is_a?(Integer)

  result = []
  while number > 0
    if number == 4
      result << "#{number}\nСейчас рванет!!!"
    else
      result << number
    end
    number -= 1
  end
  result << '!!!BOOM!!!'
end

def bomb_print(text)
  text.each do |time|
    puts time
    sleep 1
  end
end


class Test < Minitest::Test
  def test_bomb_text_correct_work
    assert_equal([5, "4\nСейчас рванет!!!", 3, 2, 1, "!!!BOOM!!!"], bomb_text(5))
  end

  def test_bomb_text_wrong_input
    assert_nil(bomb_text('a'))
  end
end
