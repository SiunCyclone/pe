require './tool'
p $fib.take_while{|x| x < 4000000 }.select{|x| x.even? }.inject(&:+)
