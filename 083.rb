def main
  ary = []

  open("./files/083/matrix.txt") do |f|
    f.each do |line|
      ary << (line.chomp.split(",").map(&:to_i))
    end
  end

  seedList = []
  seedList << { sum: ary[0][0], pos: [ 0, 0 ] }
  visitedList = {}

  add_seed = ->(direction, seed) {
    pos = [seed[:pos], direction.values].transpose.map{|xs| xs.inject(&:+) }
    index = pos.to_s.to_sym
    return if !visitedList[index].nil?
    newSeed = { sum: seed[:sum]+ary[pos[1]][pos[0]], pos: pos }

    seedList.each do |r|
      if r[:pos] == newSeed[:pos]
        if r[:sum] > newSeed[:sum]
          seedList << newSeed
          seedList.delete(r)
          return
        else
          return
        end
      end
    end
    seedList << newSeed
  }

  while !seedList.empty?
    seed = seedList.delete(seedList.min{|a, b| a[:sum] <=> b[:sum]})

    index = seed[:pos].to_s.to_sym
    visitedList[index] = seed if visitedList[index].nil?

    p seed[:sum] if seed[:pos] == [ 79, 79 ]

    add_seed.call({ x: 1, y: 0}, seed) if seed[:pos][0] != 79
    add_seed.call({ x: 0, y: 1}, seed) if seed[:pos][1] != 79
    add_seed.call({ x: 0, y: -1}, seed) if seed[:pos][1] != 0
    add_seed.call({ x: -1, y: 0}, seed) if seed[:pos][0] != 0
  end
end

main

