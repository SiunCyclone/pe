def rt(ary,table,i,lim)
	return false if i<0
	if ary[i]+table[i]<=lim
		ary[i] += table[i]
		return ary
	else
		ary[i] = 0
		rt(ary,table,i-1,lim)
	end
end

def fn
	lim = 200
	ary = [0]*5
	table = [100,50,20,10,5,2]
	i = table.length-2
	count = 1

	while true
		sum = ary.inject{|x,y| x+y}
		max = lim-sum
		if sum > lim
			ary[i] = 0
			ary = rt(ary,table,i-1,lim)
			break if !ary
		else
			ary[i] += table[i]
			count += max/table.last + 1
		end
	end
	return count
end

start = Time.now
p fn
puts 'time: '+(Time.now-start).to_s+'sec'
