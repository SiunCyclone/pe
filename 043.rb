#2012/5/28
#50min

class Integer
	def prime?
		return false if self<2
		p = 1
		while p*p<=self
			return false if self%p==0
			p += 1

		end
		true
	end
end

def div_check(ary)
	divls = [2,3,5,7,11,13,17]
	divls.size.times {|i|
		return false if not ary.slice(i+1..i+3).join.to_i % divls[i] == 0
	}
	true
end

start = Time.now
p (0..9).to_a.permutation.map{|x| div_check(x) ? x : nil }.compact.map(&:join).map(&:to_i).inject{|x,y| x+y }
p Time.now - start
