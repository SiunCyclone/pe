#2012/5/21
#25min

def foo
  list = []
  i = 11
  while list.size < 11
    list << i if comp_prime?(i)
    i += 1
  end

  p list.inject{|x,y| x+y}
end

def is_prime?(n)
  return false if n<2
  p = 2
  while p*p <= n
    return false if n%p==0
    p += 1
  end
  true
end

def comp_prime?(n)
  n.to_s.size.times do |i|
    return false if not is_prime?(n.to_s.slice(i..n.to_s.size-1).to_i)
    return false if not is_prime?(n.to_s.slice(0..n.to_s.size-i-1).to_i)
  end
  true
end
