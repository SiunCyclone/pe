require './tool'

p (2..9999).select{|x| !x.prime? && !x.perfect? && x == sum_of_true_divisors(sum_of_true_divisors(x)) }.inject(&:+)

