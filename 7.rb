require "mathn"
ary = []
p = Prime.new
p.each {|x|	if ary.size==10001 then break end
			ary << x
}
p ary.pop
