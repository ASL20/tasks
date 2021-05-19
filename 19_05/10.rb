def calc(arg1, arg2)
  yield(arg1, arg2)
end

puts calc(4, 4) { |a, b| a ** b }
