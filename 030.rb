def main
  sol = ->(n) {
    list = []
    (10**(n-2)..10**(n+1)-1).each do |x|
      num = x
      list << num if num == x.to_s.split("").map(&:to_i).map{|a| a**n }.inject(&:+)
    end

    p list.inject(&:+)
  }

  sol.call(5)
end

main

