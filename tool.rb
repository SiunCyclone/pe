require 'prime'

$fib = Enumerator.new do |yielder|
  a = b = 1
  loop do
    yielder << a
    a, b = b, a + b
  end
end

$trinum = Enumerator.new do |yielder|
  i = x = 1 
  loop do
    yielder << x
    i += 1
    x += i
  end
end

def num_of_divisors(n)
  n.prime_division.inject(1){|cnt, xs| cnt * (xs[1] + 1) }
end

def sum_of_divisors(n)
  raise ArgumentError, "Expected argument > 1. Got #{n}" if n <= 1
  n.prime_division.inject(1){|sum, xs| sum * xs.inject{|x, v| (0..v).map{|i| x**i }.inject(&:+) } }
end

def sum_of_true_divisors(n)
  sum_of_divisors(n) - n
end

class String
  def palindrome?
    self == self.reverse    
  end
end

class Integer
  def perfect?
    self == sum_of_true_divisors(self)
  end
end

class Object
  def deep_clone
    Marshal.load(Marshal.dump(self))
  end
end

