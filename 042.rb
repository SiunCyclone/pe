#2012/5/26
#30min

t = (1..1000).map{|n| 1/2.0*n*(n+1) }
alp = {}
("A".."Z").each_with_index {|x, i| alp[x] = i+1 }

f = File.read("./files/042/words.txt")
str = f.delete("\"").split(",")
p str.count{|x| !t.index(x.chars.to_a.map{|y| alp[y] }.inject(&:+)).nil? }

