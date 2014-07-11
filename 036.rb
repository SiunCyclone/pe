#2012/5/20
#15min

def foo
  list = []
  (1..1000000).each do |x|
    list << x if kaibun(x.to_s(2).split("")) && kaibun(x.to_s.split(""))
  end
  p list.inject(&:+)
end

def kaibun(ary)
  (0..ary.size-1).each do |i|
    return false if ary[i] != ary[-i-1]
  end
  return true
end

foo

