str = [3,3,5,4,4,3,5,5,4,3,6,6,8,8,7,7,9,8,8] 
num = [6,6,5,5,5,7,6,6]
ary = num.map do |x| 
  (0..9).map do |i|
    if i != 0
      str[i-1] + x
    else
      x
    end
  end
end
ary.flatten!
ary.each{|x| str << x }

re = []
9.times do |i| 
  (0..str.size).each do |x|
    if x==0
      re << (7 + str[i])
    else
      re << (10 + str.slice(0..8)[i] + str[x-1])
    end
  end
end
re.each{|x| str << x }
str << 11
p str.inject{|sum, x| sum + x }
