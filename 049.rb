#2012/6/24
#***

class Integer
  def is_prime?
    return false if self<2
    p = 2
    while p*p<=self
      return false if self%p==0
      p += 1
    end
    true
  end
end

def check2(ary)
  return false if ary.map(&:to_s).map{|x| x.split(//).sort.join }.uniq.size != 1
  true
end

def main
  ls = []
  (1000..9999).each do |a|
    next if not a.is_prime?
    (1..9000).each do |d|
      b = a+d
      c = a+2*d
       ls << [a, b, c] if b.is_prime? and c.is_prime? and check2([a, b, c])
    end
  end  
  return ls.last.join.to_i
end

start = Time.now
p main
p Time.now - start

