ary = []
(1..100).each {|x| ary << x}
po = 0
pul = 0
ary.each {|x| po += x*x; pul += x}
pul = pul**2
p pul - p
