a = (1..100).inject{|sq, i| sq*i }.to_s
p (0..a.to_s.size).inject(0){|sum, i| sum + a[i].to_i }
