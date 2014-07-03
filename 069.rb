def pr_list(n)
  list = []
  a = [true]*(n+1)
  a[0..1] = [0,0]
  i = 2
  while i*i < n
    a[i] = 1
    (i+i).step(n,i){|x| a[x] = 0}
    i = a.index(true)
  end
  a.each_with_index.map{|x, i| list << i if x!=0}
  return list
end

def fn(n)
  pr_list(n).inject do |x, y|
    if x*y > n
      @ans = x
      break
    end
    x * y
  end
  return @ans
end

p fn(1000000)
