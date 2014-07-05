require './tool'

p 999.downto(100).map{|x| x.downto(100).map{|y| product = x * y; product if product.to_s.palindrome? }.compact }.flatten.max

