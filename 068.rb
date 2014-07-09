N = 5
p (1..N*2).to_a.permutation.map{|xs|
  (N-1).times {|i| xs = xs[0..3*(i+1)] + [xs[2+3*i]] + xs[4+3*i...xs.length] }
  (xs << xs[1]).each_slice(3).to_a
}.select{|xxs| xxs.transpose.first.min == xxs.first.first }.uniq.select{|xxs| xxs.map{|xs| xs.inject(&:+) }.uniq.length == 1 }.map(&:join).select{|str| str.length == 16 }.max

