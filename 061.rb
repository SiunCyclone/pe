#2013/7/31

def polygonal(func)
  list = []
  ->(n){
    (1..10**n).each{|x| result = func[x]; list << result if (10**(n-1) <= result) && (result < 10**n) }
    list
  }
end

def cyclical(lastTwo, poly)
  poly.select{|str| str[0..1] == lastTwo }
end

def make_index_list(last, n)
  (0..n-1).select{|x| x != last }.permutation(n-1).each_with_object(last).collect(&:<<)
end

def cyclical_figurate_numbers(*list)
  list.each_with_index do |poly, i|
    indexList = make_index_list(i, 6)
    poly.each do |x|
      indexList.each do |index|
        cyclical(x[2..3], list[index[0]]).each do |y|
          cyclical(y[2..3], list[index[1]]).each do |z|
            cyclical(z[2..3], list[index[2]]).each do |w|
              cyclical(w[2..3], list[index[3]]).each do |a|
                cyclical(a[2..3], list[index[4]]).each do |b|
                  cyclical(b[2..3], list[index[5]]).each do |c|
                    if x == c
                      p [x, y, z, w, a, b, c].map(&:to_i).inject(:+) - x.to_i
                      return
                    end
                  end
                end
              end
            end
          end
        end
      end
    end    
  end
end

def main
  @ans = []
  triangle = polygonal(->(n){ n*(n+1)/2 })[4].map(&:to_s)
  square = polygonal(->(n){ n**2 })[4].map(&:to_s)
  pentagonal = polygonal(->(n){ n*(3*n-1)/2 })[4].map(&:to_s)
  hexagonal = polygonal(->(n){ n*(2*n-1) })[4].map(&:to_s)
  heptagonal = polygonal(->(n){ n*(5*n-3)/2 })[4].map(&:to_s)
  octagonal = polygonal(->(n){ n*(3*n-2) })[4].map(&:to_s)

  cyclical_figurate_numbers(triangle, square, pentagonal, hexagonal, heptagonal, octagonal)
end

main
