#2012/5/21
#35min

def foo
  list = []
  mul = (1..9).to_a
  (1..100000).each do |x|
    str = ""
    mul.each do |y|
      str += (x*y).to_s
      if str.delete("0").size == 9 && str.delete("0").split("").uniq.size == 9
        list << str.delete("0").to_i
        break
      end
    end
  end
  
  p list.max
end

foo

