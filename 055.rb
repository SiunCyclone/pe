#2013/3/9
#30min
#*

def lychrel(n)
  list = []
  max = 49

  (10..n).each do |x|
      flag = false
      max.times do |i|
        x = x + rev(x)
        break if is_kaibun(x)
        flag = true if i==(max-1)
      end
      list << x if flag
  end

  p list.size
end

def rev(num)
  return num.to_s.reverse.to_i
end

def is_kaibun(num)
  s = num.to_s
  a = (s.size % 2 == 0) ?  s.slice(0..s.size/2-1) : s.slice(0..s.size/2)
  b = s.slice(s.size/2..s.size-1).reverse
  return true if a == b
  return false
end

lychrel(10000)

