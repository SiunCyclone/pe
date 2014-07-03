#2012/6/23
#*****N

class Integer
	def pentagon
		return (3 * self * self - self) / 2
	end

	def is_penta?
		x = (1 + (1 + 24 * self) ** 0.5) / 6.0
		if x == x.to_i
			return x.to_i
		else
			return false
		end	
	end
end

penta_list = [1]
2.upto(1/0.0) do |n|
	k = n.pentagon
	penta_list.each do |j|
		if (k-j).is_penta? and (k+j).is_penta?
			p k-j
			exit
		end
	end
	penta_list.unshift(k)
end

