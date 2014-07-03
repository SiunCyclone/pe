ary = (0...1000).select {|x|
	x%3==0 || x%5==0
}
al = 0
ary.inject {|sum, i| al = sum + i}
puts al
