fac,list,stk,re = [],[],[],[]
(1..28123).each do |num|
	(1..num).each do |jo|
		fac << jo if num%jo<1 && num!=jo
	end
	list << num if num<fac.inject(0){|x,y|x+y}
	fac.clear
	re << :"#{num}"
end
list.combination(2).to_a.each do |t|
	stk << t.inject(0){|x,y|x+y}
end
stk.uniq!
list.each{|x|stk << x+x}
stk.sort!
stk.each do |x|
	re.delete(:"#{x}")
end
p re.inject{|x,y|x.to_s.to_i+y.to_s.to_i}
