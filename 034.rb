#2012/5/19
#15min

def foo
  list = []
  (3..1000000).each do |num|
    sum = 0
    (0..num.to_s.size-1).each do |i|
      sum += factorial(num.to_s[i].to_i)
    end
    list << num if sum == num
  end
  p list
  p list.inject(&:+)
end

def factorial(n)
  return 1 if n==0
  return (1..n).inject(&:*)
end

foo

