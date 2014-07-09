ary = []
(1..1000).each do |i|
  div = 1
  stk = [1]
  while true
    div *= 10 if div/i==0
    if div%i==0
      stk.clear
      ary << 0
      break
    end
    if stk.index(div%i) == nil
      stk << div%i
    else
      ary << stk.size-stk.index(div%i)
      break
    end
    div = div%i
  end
end

p ary.index(ary.max)+1

