#**

def main(n)
  list = (1..10_000).collect{|x| num = (x**3).to_s; {num => num.split(//).sort} }
  ls = (1..10_000).collect{|x| (x**3).to_s.split(//).sort }

  arg = 0  
  ls.group_by{|i| i}.each_value{|x| (arg = x.first; break) if x.length == n}
  list.each{|h| (p h.keys.first.to_i; break) if h.values.flatten == arg}
end

main(5)
