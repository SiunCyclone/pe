def ami(x)
  ary = []
  (1..x).each{|i| ary << i if x%i==0 && i!=x}
  t = ary.inject{|sum, i| sum+i}
  return t ? t :1
end

stk = []
(1...10000).each{|y| stk << y if y==ami(ami(y)) && y!=ami(y)}

p stk.inject{|a, b| a + b }
