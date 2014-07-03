#2013/3/8
#***

def a_pri(n)
  list = []  
  pr = prime_list(1000000)

  arg_list = []
  n.times{|i| arg_list << make_list(i+1) }

  count = 0
  ls = []
  pr.map(&:to_s).each do |prime|
    next if prime.length < 2

    arg_list[prime.length-2].each do |args|
      prime_copy = prime.clone
        
      10.times do |i|
        args.each do |index|
          prime_copy[index] = i.to_s
        end

        if prime_copy.to_i.is_prime? && prime.length == prime_copy.to_i.to_s.length
          count += 1
          ls << prime_copy.clone
        end
      end

      list = ls if count == n

      count = 0
      ls = []
    end

    break unless list.empty?
  end

  p list.min.to_i
end

def make_list(n)
  list = []
  n.times do |i|
    (0..n-1).to_a.combination(i+1) do |x|
      list << x
    end
  end
  
  return list
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

class Integer
  def is_prime?
    return false if self<2
    p = 2
    while p*p <= self
      return false if self%p==0
      p += 1
    end
    true
  end
end

start = Time.now
a_pri(8)
p Time.now - start
