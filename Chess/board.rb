require_relative "./pieces/pieces.rb"
class Board

  def initialize
    @rows = Array.new(8){Array.new(8)}

    @rows.each_with_index do |r,i|
      if [0,1].include?(i)
        r.each_with_index{|s,i2|self[[i,i2]] = Piece.new('white',self,[i,i2]) }
      elsif [2,3,4,5].include?(i)
        r.each_with_index{|s,i2|self[[i,i2]] = NullPiece.instance }
      elsif [6,7].include?(i)
        r.each_with_index{|s,i2|self[[i,i2]] = Piece.new('black',self,[i,i2]) }
      end
    end
    @rows[2][2] = Rook.new('white',self,[2,2])
  end

  def [](pos)
    @rows[pos[0]][pos[1]]
  end

  def []=(pos,val)
    @rows[pos[0]][pos[1]] = val
  end


  def move_piece(start,end_pos)
    raise "Position is out of bounds" if (start + end_pos).any?{|p|p<0 || p>7}
    _piece = self[start]
    raise "No piece to move" if _piece.empty?
	
    self[end_pos] = self[start]
    self[start] = NullPiece.instance
    _piece.pos = end_pos
  end

end

b = Board.new
# b.move_piece([1,1],[2,1])
# p b
p b[[2,2]].moves