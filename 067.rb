require './tool'

str = nil
open("./files/067/triangle.txt") do |f|
  str = f.read
end
line_num = []
str.scan(/([^\n]+)/).each do |line|
  line.each do |x|
    line_num << x.scan(/[0-9]+/)
  end
end
line_num.reverse!
ary,stk = [],[]

0.upto(line_num.size-2) do
  0.upto(line_num[0].size-1) do |i|
    ary << ((line_num[0][i].to_i > line_num[0][i+1].to_i) ? line_num[0][i] : line_num[0][i+1])
  end
  line_num.shift
  line_num[0].each.with_index do |x,i|
    stk << x.to_i+ary[i].to_i.deep_clone
  end
  line_num.shift
  line_num.unshift(stk.deep_clone)
  ary.clear
  stk.clear
end
puts line_num
