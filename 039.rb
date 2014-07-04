#2012/5/25
#2.5h

require 'mathn'

def foo
  @p = 1000
  pri_list = primitive_list(@p)
  
  (0..pri_list.size-1).each do |k|
    i = 2
    while true
      if pri_list[k].map{|t| t*i }.inject(&:+) <= @p
        pri_list << pri_list[k].map{|t| t*i }
      else
        break
      end
      i += 1
    end
  end
  
  max = [0,0]
  repe(pri_list.map{|x| x.inject(&:+) }.sort).map{|x| [x[0], x.size] }.each{|x| max = x if max[1]<x[1] }
  p max[0]
end

def repe(ary)
  ls = []
  st = []
  blank = true
  (0..ary.size-2).each do |i|
    st << ary[i] if blank
    if ary[i] == ary[i+1]
      st << ary[i] 
      blank = false
    else
      ls << st
      blank = true
      st = []
    end
    ls << st if i==ary.size-2
  end
  return ls
end

def rela_prime(ary)
  st = []
  ary.map do |x|
    x.prime_division.each{|y| st << y[0] }
  end
  return true if st.size == st.uniq.size
  false  
end

def primitive_list(num)
  ls = []
  even_list = (2..num/2).select{|x| x%2==0 }
  odd_list = (1..num/2).select{|x| x%2!=0 }

  (2..num/2).each do |m|
    if m%2==0
      odd_list.each do |n|
        if m>n
          a = m**2 - n**2
          b = 2*m*n
          c = m**2 + n**2  
          ls << [a,b,c] if !(a+b+c>num) && rela_prime([a,b,c])
        end
      end
    else
      even_list.each do |n|
        if m>n
          a = m**2 - n**2
          b = 2*m*n
          c = m**2 + n**2  
          ls << [a,b,c] if !(a+b+c>num) && rela_prime([a,b,c])
        end
      end
    end
  end

  return ls
end

start=Time.now
foo
puts "time: " + (Time.now-start).to_s + "sec"
