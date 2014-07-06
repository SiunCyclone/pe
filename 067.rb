str = open("./files/067/triangle.txt"){|f| f.read.scan(/[0-9][^\n\r]+/).map{|x| x.scan(/\w+/).map(&:to_i) } }.reverse

def trimax(seed, child)
  seed.map.with_index{|x, i| x + [child[i], child[i+1]].max }
end

list = str.first
p (1...str.length).map{|i| list = trimax(str[i], list) }.flatten.last

