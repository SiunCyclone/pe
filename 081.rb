def main
  ary = []

  open("./files/081/matrix.txt") do |f|
    f.each do |line|
      ary << (line.chomp.split(",").map(&:to_i))
    end
  end

  seedList = []
  seedList << { sum: ary[0][0], pos: [ 0, 0 ] }

  add_seed = ->(direction, seed) {
    pos = [seed[:pos], direction.values].transpose.map{|xs| xs.inject(&:+) }
    tmp = { sum: seed[:sum]+ary[pos[1]][pos[0]], pos: pos }
    seedList.each do |r|
      if r[:pos] == tmp[:pos]
        if r[:sum] > tmp[:sum]
          seedList << tmp
          seedList.delete(r)
          return
        else
          return
        end
      end
    end
    seedList << tmp
  }

  while !seedList.empty?
    seed = seedList.shift
    p seed[:sum] if seed[:pos] == [ 79, 79 ]
    add_seed.call({ x: 1, y: 0}, seed) if seed[:pos][0] != 79
    add_seed.call({ x: 0, y: 1}, seed) if seed[:pos][1] != 79
  end
end

main

