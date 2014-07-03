#2012/5/26
#25min

require 'mathn'

def seq_num(n, ary)
  ls = []
  st = []
  (0..ary.size-2).each{|i|
    st << ary[i]
    ls << st if st.size == n
    st = [] if not ary[i]+1 == ary[i+1]
  }
  return ls
end

def seq_div_prime(n)
  ls = []
  (2..1000000).each{|x|
    t = x.prime_division
    ls << x if t.size==n 
  }
  return seq_num(n, ls)
end

start = Time.now
p seq_div_prime(4).min.min
p Time.now-start
  
