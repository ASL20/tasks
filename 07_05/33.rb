require 'minitest/autorun'

def border_print(array)
  result = []
  max_string = nil
  array.each_with_index do |n, index|
    max_string = array[0]
    max_string = n if n.length > max_string.length
  end

  stars = "*" * (max_string.length + 4)
  result << stars

  array.each do |n|
    result << "* #{n}" + (" " * (stars.length - n.length - 4)) + " *"
  end

  result << stars
end

class Test < Minitest::Test
  def test_border_print_correct_work
    assert_equal(["*********", "* Hello *", "* World *", "* in    *", "* a     *", "* frame *", "*********"],
      border_print(["Hello", "World", "in", "a", "frame"]))
  end
end
