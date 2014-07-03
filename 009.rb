m = (1..100).select{|x| x%2==0}
n = (1..100).select{|x| x%2!=0}
a = []
b = []
c = []
(0..m.size-1).each {|i|
	(0..n.size-1).each {|t|
		a << (m[i]**2-n[t]**2).abs
		b << 2*m[i]*n[t]
		c << m[i]**2+n[t]**2
	}
}
(0..a.size-1).each {|q|
	if a[q]+b[q]+c[q]==1000
		p a[q]*b[q]*c[q]
	end
}
