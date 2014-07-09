def foo(num,sum,dis,n)
  return sum if n==num**2
  4.times{|i|
    n += dis
    sum += n
  }
  foo(num,sum,dis+2,n)
end
  
p foo(1001,1,2,1)

