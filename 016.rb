p (0...(2**1000).to_s.size).inject(0){|sum, i| sum + (2**1000).to_s[i].to_i }
