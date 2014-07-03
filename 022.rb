str = nil
open("./files/022/names.txt") do |f|
  str = f.read.scan(/\w+/)
end
str = str.sort
i = 1
koq = []
str.map {|x|
  koq << i * (0..x.size-1).inject(0) {|sum, y|
    case x[y]
      when "A"
        sum + 1
      when "B"
        sum + 2
      when "C"
        sum + 3
      when "D"
        sum + 4
      when "E"
        sum + 5
      when "F"
        sum + 6
      when "G"
        sum + 7
      when "H"
        sum + 8
      when "I"
        sum + 9
      when "J"
        sum + 10
      when "K"
        sum + 11
      when "L"
        sum + 12
      when "M"
        sum + 13
      when "N"
        sum + 14
      when "O"
        sum + 15
      when "P"
        sum + 16
      when "Q"
        sum + 17
      when "R"
        sum + 18
      when "S"
        sum + 19
      when "T"
        sum + 20
      when "U"
        sum + 21
      when "V"
        sum + 22
      when "W"
        sum + 23
      when "X"
        sum + 24
      when "Y"
        sum + 25
      when "Z"
        sum + 26
      end
  }
  i += 1
}
p koq.inject {|sum, x| sum + x}
