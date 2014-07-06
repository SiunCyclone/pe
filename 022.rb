ALPHABET = ("A".."Z").to_a
p open("./files/022/names.txt").read.scan(/\w+/).sort.map.with_index(1){|name, i| name.split(//).inject(0){|sum, c| sum + (ALPHABET.index(c) + 1) } * i }.inject(&:+)

