# 2014/3/31

require 'pp'

class Board
  attr_reader :answer, :cellList

  def initialize(problem)
    @problem = problem
    @cellList, @answer = [], []

    @problem.each_with_index do |line, y|
      line.split("").map(&:to_i).each_with_index do |num, x|
        possibleList = (num == 0) ? (1..9).to_a : []
        @cellList << Cell.new(x, y, num, 3*(y/3) + x/3, possibleList)
      end
    end
  end

  def solve
    impl1 
    impl2

    return false if (error?)

    apply
    return true
  end

  def error?
    @cellList.each do |cell|
      return true if cell.num == 0
    end

    row, column, group = [], [], []
    (0..8).each do |i|
      (0..8).each do |o|
        row << @cellList[i*9+o].num
        return true if row.length != row.uniq.length

        column << @cellList[o*9+i].num
        return true if column.length != column.uniq.length

        group << @cellList[(i*3)+(o%3) + ->{o>5 ? 18 : (o>2 ? 9 : 0)}.call + ->{i>5 ? 36 : (i>2 ? 18 : 0)}.call].num
        return true if group.length != group.uniq.length
      end
      #pp group
      row, column, group = [], [], []
    end

    return false
  end

  # Checking row, column and group
  def impl1
    update_possibleList = -> {
      delete_impl = ->(targetCell) {
        @cellList.each do |cell|
          next if !( (cell.x == targetCell.x) || (cell.y == targetCell.y) || (cell.group == targetCell.group) )
          cell.possibleList.delete(targetCell.num)
        end
      }

      @cellList.each do |cell|
        if cell.num != 0
          delete_impl.call(cell)
        end
      end
    } 

    detect_the_number = -> {
      preList = Marshal.load(Marshal.dump(@cellList.map(&:num)))
      @cellList.each do |cell|
        if cell.possibleList.length == 1
          cell.num = cell.possibleList.pop
        end
      end

      if preList == @cellList.map(&:num)
        @updating = false
      end
    }

    @updating = true 
    while @updating
      update_possibleList.call
      detect_the_number.call
    end
  end

  # Prediction way
  def impl2
    @cellList.each do |cell|
      next if cell.possibleList.empty?
      cell.possibleList.each do |pnum|
        cell.num = pnum

        tmp = []
        9.times do |i|
          tmp << Marshal.load(Marshal.dump(@cellList[i*9..(i+1)*9-1].map(&:num).join))
        end

        board = Board.new(tmp)

        if (board.solve)
          @cellList = Marshal.load(Marshal.dump(board.cellList))
        end
      end

      break
    end
  end

  def apply
    9.times do |i|
      @answer << Marshal.load(Marshal.dump(@cellList[i*9..(i+1)*9-1].map(&:num)))
    end
  end
end

class Cell
  def initialize(x, y, num, group, possibleList)
    @x = x
    @y = y
    @num = num
    @group = group
    @possibleList = possibleList
  end

  attr_accessor :x, :y, :num, :group, :possibleList
end

def solver(problem)
  board = Board.new(problem)

  pp problem
  board.solve
  pp board.answer
  puts

  return board.answer
end

def main
  problem = []

  sum = 0
  open("files/096/sudoku.txt") do |f|
    f.each_with_index do |line, i|
      problem << line.chomp if line[0] != "G"

      if ((i+11) % 10 == 0) 
        p sum += solver(problem)[0][0..2].join.to_i
        problem = []
      end
    end
  end
end

main
