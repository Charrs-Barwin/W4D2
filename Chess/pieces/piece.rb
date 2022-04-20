class Piece
  attr_reader :color,:board,:pos
  attr_writer :pos
  @@ADJACENT = [[0,1],[0,-1],[-1,0],[1,0]]
  @@DIAGONAL = [[1,1],[-1,1],[1,-1],[-1,-1]]
  def initialize(color=nil,board,pos)
    @color,@board,@pos = color,board,pos
  end

  def moves

  end

  def to_s
    
  end

  def inspect
    p color + " #{pos}"
  end

  def empty?
    false
  end

  def valid_moves

  end

  def Symbol
    
  end

  def move_into_check(end_pos)

  end

end


class Array

  def add(arr2)
    self.map.with_index{|e,i| e + arr2[i] }
  end

  def times(n)
    self.map{|e| e*n }
  end

end


module Stepable

  def move_dirs
    raise "move_dirs needs to be overridden"
  end

  def moves

  end
  
end


module Slideable 

  def move_dirs
    raise "move_dirs needs to be overridden"
  end

  def moves
    result = []
    for dir in move_dirs
      n = 1
      8.times do
        new_pos = pos.add(dir.times(n))
        break if new_pos.any?{|p| p<0 || p>7 } || board[new_pos].color == color
        result << new_pos
        break if board[new_pos].color
        n += 1
      end
    end
    result
  end
  
end
