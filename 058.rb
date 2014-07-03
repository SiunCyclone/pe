#2013/3/10
#1.2h 
#**

require 'prime'

pr_cnt = 0
tai_cnt = 0

t = Time.now
i = 1
(3..100000).step(2) do |side|
  (side**2-6*i..side**2).step(side-1) do |num|
    tai_cnt += 1
    pr_cnt += 1 if Prime.prime?(num)
  end
  i += 1

  if pr_cnt / (tai_cnt+1).to_f * 100 < 10
    p side
    break
  end
end

puts
p Time.now-t
