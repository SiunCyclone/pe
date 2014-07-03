#40min

def foo
  list = (2..1_000_000).select{|x| not x.to_s.size.times.find{|i| not is_prime?(trd(x, i)) } }
  p list.size
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

def trd(n, count)
  rl = ""
  ary = n.to_s.split("")
  (count..ary.size-1).each{|i| rl += ary[i]}
  (0..count-1).each{|i| rl += ary[i]}
  return rl.to_i
end

start = Time.now
foo 
p Time.now - start

