a = (1..100).inject {|sq, i| sq*i}.to_s
p (0..a.to_s.size).inject(0) {|sum, x|
  sum + a[x].to_i 
}
