#*

def main
  cnt = 0
  (1..100).each do |x|
    (1..100).each do |i|
      if (x**i).to_s.length == i
        cnt += 1
      end
    end
  end
  p cnt
end

main

