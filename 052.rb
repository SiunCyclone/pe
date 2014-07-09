#2012/5/26
#15min

def product_same(n, i)
  return true if ((n*i).to_s.split(//) - n.to_s.split(//)).empty?
  false
end

(1..1000000).each do |x|
  flag = true
  (2..6).each do |i|  
    flag = false if not product_same(x, i)
  end
  next if not flag
  p x
  break
end

