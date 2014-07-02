i=0
fib = [1,2]
while fib[fib.size-1]+fib[fib.size-2]<4000000
	fib << fib[i] + fib[i+1]
	i+=1
end

ary = []
ary = fib.select{|x| x%2==0}
sum = 0
ary.each {|x|
	sum += x
}
puts sum
