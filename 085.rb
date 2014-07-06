#2014/7/6
#1h

def make_table(width, height)
  base = (1..width).to_a
  (1..height).map{|x| base.map{|y| x * y } }
end

def count_rectangle(table)
  table.flatten.inject(&:+)
end

def main
  list = []
  (1..80).each do |i|
    (1..i).each do |k|
      list << [count_rectangle(make_table(i, k)), i * k]
    end
  end
  p list.map{|x, s| [(x - 2000000).abs, x, s] }.sort{|a, b| a <=> b }.first.last
end

main

