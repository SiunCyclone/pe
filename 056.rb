#2012/5/26
#5min

LIM = 100

def googol
	max = 0
	(1..100).each{|a|
		(1..100).each{|b|
			t = (a**b).to_s.split(//).map(&:to_i).inject{|x, y| x+y }
			max = t if t > max
		}
	}
	p max
end

googol
