require 'prime'
p Prime.each(2000000).inject{|a, b| a + b }
