#2012/5/26
#20min

def exponent_under10(n, m)
  return n if m==1
  (2..m).each do |i|
    n *= 2
    n = n.to_s[-10,10].to_i if n.to_s.split(//).size > 10
  end
  return n
end

start = Time.now
p (28433*exponent_under10(2,7830457)+1).to_s[-10,10].to_i
p Time.now-start
