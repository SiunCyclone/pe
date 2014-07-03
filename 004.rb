list = []
999.downto(100) do |x|
  x.downto(100) do |y|
    tmp = "#{x * y}"
    if tmp.size > 5 && tmp[0]==tmp[-1] && tmp[1]==tmp[-2] && tmp[2]==tmp[-3]
      list << tmp.to_i
    end
  end
end
p list.max
