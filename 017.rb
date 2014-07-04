list = [3,3,5,4,4,3,5,5,4,3,6,6,8,8,7,7,9,8,8] 

[6,6,5,5,5,7,6,6].each do |x| 
  (0..9).each do |i|
    list << (i != 0 ? list[i-1] + x : x)
  end
end

9.times do |i| 
  (0..99).each do |x|
    list << (x == 0 ? list[i] + "hundred".length : (list[i] + "hundred and".split.join.length + list[x-1]))
  end
end

p (list << "one thousand".split.join.length).inject(&:+)
