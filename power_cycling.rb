(83..100).each do |m|
  cycles = []
  lengths = []
  (2..23).each do |b|
    (1..m-1).each do |k|
      arr = [k % m]
      candidate = arr.last * b % m
      until arr.include? candidate
        arr << candidate
        candidate = candidate * b % m
      end
      length = arr.length-arr.index(candidate)
      unless lengths.include? length
        lengths << length
        cycles << {
          b: b,
          k: k,
          length: arr.length-arr.index(candidate),
          arr: arr
        }
      end
    end
  end
  puts "Using modulus m=#{m}:"
  puts
  cycles.each do |cycle|
    puts "For starting number k=#{cycle[:k]} and multiple b=#{cycle[:b]}:"
    puts "  Cycle length: #{cycle[:length]}"
    puts "  Array: #{cycle[:arr]}"
    puts
  end
  puts
end