def prime_list(lim)
  list = []
  a = [true]*(lim+1)
  a.each_with_index do |e,i|
    if i>=2 && e
      a[i] = false
      list << i
      i.upto(lim/i){|j| a[i*j] = false }
    end
  end
  list
end

def fn(n)
  prime_list(n).inject do |x, y|
    if x*y > n
      @ans = x
      break
    end
    x * y
  end
  return @ans
end

p fn(1000000)

