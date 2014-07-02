str = "75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"
line_num,ary,stk = [],[],[]
str.scan(/([^\n]+)/).each{|line|line.each{|x|line_num<<x.scan(/[0-9]+/)}}
line_num.reverse!
0.upto(line_num.size-2) do
	0.upto(line_num[0].size-1) do |i|
		ary << ((line_num[0][i].to_i > line_num[0][i+1].to_i) ? line_num[0][i] : line_num[0][i+1])
	end
	line_num.shift
	line_num[0].each.with_index do |x,i|
		stk << Marshal.load(Marshal.dump(x.to_i+ary[i].to_i))
	end
	line_num.shift
	line_num.unshift(Marshal.load(Marshal.dump(stk)))
	ary.clear;stk.clear
end
puts line_num
