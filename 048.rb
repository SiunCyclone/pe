#2012/5/26
#1min

p (1..1000).map{|x| x**x }.inject{|x, y| x+y}.to_s[-10,10]