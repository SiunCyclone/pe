require "mathn"
p = Prime.new
ary = []
while (if ary.size!=0 
		ary[ary.size-1]<=20
		else (1) end)
	ary << p.next
end
ary.pop
stk = []
ary.each {|x|
	i = 2
	while x**i<=20
		stk << x
		i += 1
		if x**i>20
			break
		end
	end
}
ary += stk
sq = 1
ary.each {|x|
	sq *= x
}
p sq
