
# 23sec
start = Time.now

t = 2
n = 2
ary,stk,re = [],[],[]
while t < 1000000
	ary << t
	re << t
	while ary.last>1
		n = (ary.last % 2 == 0) ? (n / 2) : (n * 3 + 1)
		ary << n
	end
	stk << ary.size
	t += 1
	n = t
	ary.clear
end

p re[stk.index(stk.sort.last)]
puts Time.now - start
