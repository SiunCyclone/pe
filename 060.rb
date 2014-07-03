#*****

class Integer
  def is_prime?
    return false if self < 2
    p = 2
    while p*p <= self
      return false if self%p == 0
      p += 1
    end
    return true
  end
end

def prime_list(lim)
  list = []
  a = [true]*(lim+1)
  a.each_with_index {|e,i|
    if i>=2 && e
      a[i] = false
      list << i
      i.upto(lim/i){|j| a[i*j]=false }
    end
  }
  list
end

def make_table(n)
  pr_list = prime_list(n)
  pr_list.each do |base|
    pr_list.each do |x|
      @table[base] ||= []
      if (base.to_s+x.to_s).to_i.is_prime? && (x.to_s+base.to_s).to_i.is_prime? && base.is_prime? && x.is_prime?
        @table[base] << x
      end
    end
  end
end

def collect_pair_sets(key, list)
  list.each do |x|
    match = list & @table[x]
    unless match.empty?
      match.each do |y|
        match2 = match & @table[y]
        unless match2.empty?
          match2.each do |z|
            match3 = match2 & @table[z]
            unless match3.empty?
              @ary << [key, x, y, z, match3.first].inject(:+)
            end
          end
        end
      end
    end
  end
end

def main
  @ary = []
  @table = {}
  make_table(10_000)
  @table.each{|key, list| collect_pair_sets(key, list) }
  @ary.min
end

start = Time.now
p main
puts Time.now - start
