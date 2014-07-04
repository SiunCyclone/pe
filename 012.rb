require "mathn"

n = 0
t = 1
step = 1
while n < 501
  n = t.prime_division.inject(1){|sum, x| sum * (x[1] + 1)}
  step += 1
  t += step
end

p t - step
