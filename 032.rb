def comb(n, i, k)
  list = []
  tmp = (1..n).to_a
  tmp.combination(i).each do |a|
    (tmp - a).combination(k).each do |b|
      c = (tmp - a - b)
      a.permutation.each do |x|
        b.permutation.each do |y|
          c.permutation.each do |z|
            s = x.join.to_i
            t = y.join.to_i
            u = z.join.to_i
            list << u if s * t == u
          end
        end
      end
    end
  end
  return list
end

def main
  sol = ->() {
    list = []
    list << comb(9, 1, 4)
    list << comb(9, 2, 3)
    p list.flatten.uniq.inject(&:+)
  }

  sol.call
end

main

