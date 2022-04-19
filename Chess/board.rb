require_relative "piece"
class Board

  def initialize
    @rows = Array.new(8){Array.new(8)}

    placement_white=@rows[0..1]
    placement_null = @rows[2..5]
    placement_black = @rows[6..7]

    placement_white.each do |r|
      r.each_with_index{|s,i|s = Piece.new('white',self,i) }
    end
    placement_null.each do |r|
      r.each_with_index{|s,i|s = Piece.new('_',self,i) }
    end
    placement_black.each do |r|
      r.each_with_index{|s,i|s = Piece.new('black',self,i) }
    end

  end

  def [](pos)
    @rows[pos[0]][pos[1]]
  end

  def []=(pos,val)
    @rows[pos[0]][pos[1]] = val
  end


  def move_piece(start,end_pos) # This should update the 2D grid and also the moved piece's position
    # raise error if; -there is no piece at start_pos, or -the piece cannot move to end_pos
    _piece = self[start]
    raise "No piece to move" if _piece.nil?
    raise "Cannot move to this position" if pos.any?{|p|p<0 || p>7}
    self[end_pos] = self[start]
    self[start] = nil
    _piece.pos = end_pos
  end

end