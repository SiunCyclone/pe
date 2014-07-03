#2013/7/26

def memoize(func)
  @cache = {}
  ->(n){ @cache[n] ||= func[n] }
end

def main(lim)
  collatz = memoize(->(n){ n==1 ? 0 : 1+collatz[n%2==0 ? n/2 : 3*n+1] })
  (1...lim).each{|x| collatz[x] }
  @cache.max{|a, b| a[1] <=> b[1] }.first
end

p main(1_000_000) #4.3sec
