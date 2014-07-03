#2012/5/30
#45min

class Integer
	def is_prime?
		return false if self<2
		p = 2
		while p*p<=self
			return false if self%p==0
			p += 1
		end
		true
	end
end

def gbach(n)
	(1..Math.sqrt(n)).each{|i| return true if (n - 2*i**2).is_prime? }
	false
end

p (1..10000).step(2).select{|x| not x.is_prime? and x!=1 }.each{|x| break x if not gbach(x) }

