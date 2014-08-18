def main
  ary = []

  open("./files/082/matrix.txt") do |f|
    f.each do |line|
      ary << (line.chomp.split(",").map(&:to_i))
    end
  end

  seedList, goalList = [], []
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

  80.times do |i|
    seedList = []
    visitedList = {}
    seedList << { sum: ary[i][0], pos: [ 0, i ] }

    while !seedList.empty?
      seed = seedList.delete(seedList.min{|a, b| a[:sum] <=> b[:sum]})

      index = seed[:pos].to_s.to_sym
      visitedList[index] = seed if visitedList[index].nil?

      add_seed.call({ x: 1, y: 0}, seed) if seed[:pos][0] != 79
      add_seed.call({ x: 0, y: 1}, seed) if seed[:pos][1] != 79
      add_seed.call({ x: 0, y: -1}, seed) if seed[:pos][1] != 0
    end

    goalList << visitedList.values.select{|xs| xs[:pos][0] == 79 }.min{|a, b| a[:sum] <=> b[:sum] }
  end

  p goalList.min{|a, b| a[:sum] <=> b[:sum]}[:sum]
end

main

