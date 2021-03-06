#2012/6/27
#***

require 'prime'

def prime_list(lim)
  list = []
  a = [true]*(lim+1)
  a.each_with_index do |e,i|
    if i>=2 && e
      a[i] = false
      list << i
      i.upto(lim/i){|j| a[i*j]=false }
    end
  end
  list
end

def prime(make_num)
  i = 0
  n = 0
  while i < make_num
    n += 1
    i += 1 if n.prime?
  end
  return n
end

def max_prime_sum(n)
  pr = prime_list(10000)
  k = 0
  l = pr.size-1
  type = "move_to_left"
  
  (1...1/0.0).each do |i|
    sum = pr.slice(k..l).inject(&:+)
    return sum if sum.prime? and sum < n

    if type=="move_to_left" and k==0
      type = "decrease_right"
    elsif type=="decrease_right"
      type = "move_to_right"
    elsif type=="move_to_right" and l==pr.size-1
      type = "decrease_left"
    elsif type=="decrease_left"
      type = "move_to_left"
    end

    case type
      when "decrease_left"
        k += 1
      when "decrease_right"
        l -= 1
      when "move_to_left"
        k -= 1
        l -= 1
      when "move_to_right"
        k += 1
        l += 1
    end
  end
end

start = Time.now
p max_prime_sum(1000000)
p Time.now - start

