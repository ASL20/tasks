def string_first(string)
  string[0]
end

def arr_first(arr)
  arr[0]
end

def string_last(string)
  string[-1]
end

def arr_last(arr)
  arr[-1]
end

string = "Terminator"
arr = string.split('')

puts string_first(string)
puts string_last(string)

puts arr_first(arr)
puts arr_last(arr)
