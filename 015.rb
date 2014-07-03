sw = (1..40).to_a.inject {|sq, i| sq*i}
tw = (1..20).to_a.inject {|sq, i| sq*i}
p sw/tw/tw
