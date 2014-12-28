puts "Let ord(m,b,k) be the length between the first two repeated terms in"
puts "the sequence given by a_n=(k*b^n mod m).\n"

(83..100).each do |m|
  (2..23).each do |b|
    (1..m-1).each do |k|
      arr = [k % m]
      candidate = arr.last * b % m
      until arr.include? candidate
        arr << candidate
        candidate = candidate * b % m
      end
      puts "ord(#{m},#{b},#{k})=#{arr.length-arr.index(candidate)}"
      puts "     #{arr+[candidate]}\n"
    end
  end
end