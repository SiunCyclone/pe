ary = []

(1..999).each {|x|
	(1..999).each {|y|
		tq = "#{x * y}"
		if tq[0]==tq[tq.size-1]
		if tq.size>5
		if tq[1]==tq[tq.size-2]
		if tq[2]==tq[tq.size-3]
			ary << tq
		end
		end
		end
		end
	}
}

stk = []
ary.uniq!
ary.each {|x|
	stk << x.to_i
}
stk.sort!
p stk
