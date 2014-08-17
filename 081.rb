def main
  ary = []

  open("./files/081/matrix.txt") do |f|
    f.each do |line|
      ary << (line.chomp.split(",").map(&:to_i))
    end
  end

  rootList = []
  rootList << { sum: ary[0][0], pos: [ 0, 0 ] }

  add_root = ->(direction, root) {
    pos = [root[:pos], direction.values].transpose.map{|xs| xs.inject(&:+) }
    tmp = { sum: root[:sum]+ary[pos[1]][pos[0]], pos: pos }
    rootList.each do |r|
      if r[:pos] == tmp[:pos]
        if r[:sum] > tmp[:sum]
          rootList << tmp
          rootList.delete(r)
          return
        else
          return
        end
      end
    end
    rootList << tmp
  }

  while !rootList.empty?
    root = rootList.shift
    p root[:sum] if root[:pos] == [ 79, 79 ]
    add_root.call({ x: 1, y: 0}, root) if root[:pos][0] != 79
    add_root.call({ x: 0, y: 1}, root) if root[:pos][1] != 79
  end
end

main

