#2013/3/10
#40min
#*

require'mathn'

def square(n, max)
	count = 0
	(1..max).each do |i|
		t = f(i, n).to_s.split("/").map(&:size).uniq
		count += 1 if t.size != 1 && t.max == t[0]
	end
	p count
end

def f(n, e, s=0, i=1)
	return false if n<1
	return 1+1/e if n==1
	return 1+s if n==i
	s = (i==1) ?  1/(e + 1/e) : 1/(e+s)
	f(n, e, s, i+1)
end

square(2, 1000)
