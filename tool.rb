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
  Prime.prime_division(n).inject(1){|a, b| a * (b[1] + 1) }
end

class String
  def palindrome?
    self == self.reverse    
  end
end

class Object
  def deep_clone
    Marshal.load(Marshal.dump(self))
  end
end
