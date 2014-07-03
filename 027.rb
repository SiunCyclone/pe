#3h

def is_prime?(n)
	return false if n<2
	p = 2
	while p*p<=n
		return false if(n%p==0)
		p+=1
	end
	true
end
start = Time.now
limit = 1000
@max, @ab = 0, [0,0]

(-limit).upto(limit) {|a|
	(-limit).upto(limit) {|b|
		n = 0
		while is_prime?(n**2 + a*n + b)
			n += 1
		end
		@max, @ab = n, [a,b] if n>@max
	}
}

p @ab[0] * @ab[1]
puts 'time: '+(Time.now-start).to_s+'sec'

