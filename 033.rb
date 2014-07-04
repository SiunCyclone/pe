#2012/5/18
#2h

def foo
  hash = {:s => [], :b => []}  
  
  (11..49).each do |i|
    ls = (i..99).select{|x| x%i == 0}.reject{|x| x%10==0}
    next if ls.empty?

    (0..ls.size-2).each do |i|
      (i+1..ls.size-1).each do |o|
        (0..ls[i].to_s.size-1).each do |n|
          if /#{ls[i].to_s[n]}/ =~ ls[o].to_s
            n_s = ls[i].to_s.delete(ls[i].to_s[n]).to_f
            n_b = ls[o].to_s.delete(ls[i].to_s[n]).to_f

            if n_s / n_b.to_f == ls[i] / ls[o].to_f
              hash[:s] << ls[i]
              hash[:b] << ls[o]
            end  
          end
        end
      end
    end

  end

  a = []
  hash.each_value do |value|
    a <<  value.inject(&:*)
  end

  p divide(a)[1]
end

def divide(ary)
  cs = []
  (2..ary[0]).each do |i|
    if ary[0]%i == 0 && ary[1]%i == 0
      cs = [ary[0]/i, ary[1]/i]
    end
  end

  return ary if cs.empty?

  divide(cs)
end

foo
