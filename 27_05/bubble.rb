require 'benchmark'

def bubble_sort(arr)
  swap = true
  size = arr.length - 1
  while swap
    swap = false
    for i in 0...size
      if arr[i] > arr[i + 1]
        swap = true
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
      end
    end
    size -= 1
  end
  arr
end


arr = []
[100, 1000, 5000].each do |num|
  File.open("#{num}.txt", "r") { |f| arr << f.readlines }
end

file = File.open('benchmark.txt', 'w') do |f|
  arr.each do |n|
    Benchmark.bm do |x|
      puts x
      f.puts x.report { bubble_sort(n) }
    end
  end
end


