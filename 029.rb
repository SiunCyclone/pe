ary = []
2.upto(100){|a|2.upto(100){|b|ary << a**b}}
p ary.uniq.size

