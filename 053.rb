#2012/5/26
#10min

def combination(n, r)
  return factorial(n)/(factorial(r)*(factorial(n-r)))
end

def factorial(n)
  return false if n<0
  return 1 if n==0
  return (1..n).inject(&:*)
end

def foo
  p (1..100).map{|i| (1..i).count{|x| combination(i,x) > 1000000 } }.inject(&:+)
end

foo

