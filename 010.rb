require 'prime'
p Prime.each(2000000).to_a.inject{|a, b| a + b }
