require "mathn"
q = Prime.new
sum = 0
ch = 0
while ch<=2000000
	ch = q.next
	if ch<=2000000
		sum += ch
	end
end
p sum
