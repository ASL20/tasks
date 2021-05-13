require_relative '28'

def move_zeroes(arr)
  tmp = split(arr, 0)
  arr.each do |n|
    tmp << n if n == 0
  end
  tmp.flatten
end
