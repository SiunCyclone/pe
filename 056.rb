#2012/5/26
#5min

LIM = 100

def googol
  max = 0
  (1..100).each do |a|
    (1..100).each do |b|
      t = (a**b).to_s.split(//).map(&:to_i).inject{|x, y| x+y }
      max = t if t > max
    end
  end
  p max
end

googol
