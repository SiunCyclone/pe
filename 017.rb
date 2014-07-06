list = [3,3,5,4,4,3,5,5,4,3,6,6,8,8,7,7,9,8,8] 
list += [6,6,5,5,5,7,6,6].map{|x| (0..9).map{|i| i != 0 ? list[i-1] + x : x } }.flatten
list += 9.times.map{|i| (0..99).map{|x| x == 0 ? list[i] + 7 : list[i] + 10 + list[x-1] } }.flatten

p (list << 11).inject(&:+)

