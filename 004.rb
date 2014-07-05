require './tool'

list = []
999.downto(100) do |x|
  x.downto(100) do |y|
    tmp = "#{x * y}"
    if tmp.palindrome?
      list << tmp.to_i
    end
  end
end
p list.max
