require 'bigdecimal'
require './tool'

p (1..100).select{|x| !x.square? }.inject(0){|sum, x| sum + BigDecimal(x.to_s).sqrt(100).to_s("F")[0..100].scan(/[0-9]/).map(&:to_i).inject(&:+) }

