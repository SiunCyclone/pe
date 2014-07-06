require './tool'

p $fib.take_while{|x| x.to_s.length < 1000 }.length + 1

