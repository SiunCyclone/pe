# 2014/3/31
# To memoize. Too slow.

def main
  sum = 0
  (1...10_000_000).each do |x|
    if (square_plus(x) == 89)
      sum += 1
    end
  end
  p sum
end

def square_plus(num)
  return num if num == 1 || num == 89

  sum = 0
  num.to_s.split("").each do |a|
    sum += a.to_i ** 2
  end

  square_plus(sum)
end

main
