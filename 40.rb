#2012/5/25
#10min

def foo
	ls = (1..1000000).to_a.join
	p ls[1-1].to_i * ls[10-1].to_i * ls[100-1].to_i * ls[1000-1].to_i * ls[10000-1].to_i * ls[100000-1].to_i * ls[1000000-1].to_i
end

foo
