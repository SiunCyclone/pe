# 2014/4/1

def main
  ary = []
  open("files/099/base_exp.txt") do |f|
    f.each_with_index do |line, i|
      ary << line.chomp.split(",").map(&:to_i)
    end
  end

  p func(ary)[3]
end

def func(ary, depth=3, first=true)
  return ary.flatten if ary.length == 1

  ary.each_with_index do |pair, i|
    ary[i][2] = (pair[0] ** pair[1].to_s.slice(0..depth).to_i).to_s.length
    ary[i][3] = i+1 if first
  end

  max = ary.max{|a, b| a[2] <=> b[2] }[2]
  distance = 3
  ary.select!{|a| a[2] > (max-distance) }

  func(ary, depth+1, false)
end

main

