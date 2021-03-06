#2012/5/28
#50min

def div_check(ary)
  divls = [2,3,5,7,11,13,17]
  divls.size.times {|i|
    return false if not ary.slice(i+1..i+3).join.to_i % divls[i] == 0
  }
  true
end

start = Time.now
p (0..9).to_a.permutation.map{|x| div_check(x) ? x : nil }.compact.map(&:join).map(&:to_i).inject(&:+)
p Time.now - start

