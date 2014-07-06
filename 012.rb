require './tool.rb'

p $trinum.lazy.select{|x| 500 < num_of_divisors(x) }.first

