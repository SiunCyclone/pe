fib = [1,1]
while fib.last.to_s.size<1000
  fib << fib[fib.size-2] + fib.last
end
p fib.size
