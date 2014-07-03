#2012/5/26
#1.5h

class Fixnum
  def is_prime?
    return false if self<2
    p = 2
    while p*p <= self
      return false if self%p==0
      p += 1
    end
    true
  end
end

def anagram(n, m=0, perm=[], ary=[])
  if n==m
    ary << perm
  else
    (1..n).each{|x| anagram(n, m+1, perm+[x], ary) if not perm.member?(x) }
  end
  ary
end

p anagram(7).flat_map{|x| x.join.to_i}.select{|x| x.is_prime? }.max
