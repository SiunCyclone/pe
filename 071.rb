#2014/4/1

def memo(func)
  @cache ||= {}
  ->(a) {
    value = func[a]
    return if value == 0
    @cache[a] ||= value
  }
end

def main(d, max)
  hcf = memo(->(a){ (a < max) ? a : 0 })

  (2..d).each do |di|
    ((di/1000000000000.0*428571285713).to_i..(di/1000000000000.0*428571428571).to_i).each do |ni|
      tmp = Rational(ni, di)
      hcf[tmp]
    end
  end

  answer = @cache.max{|a, b| a[1] <=> b[1] }.first
  p answer.to_f
  p answer
  p answer.numerator
end

main(1_000_000, Rational(3, 7))

