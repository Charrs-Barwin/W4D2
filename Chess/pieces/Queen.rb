require_relative "piece"

class Queen < Piece
    include Slideable

    def initialize(color=nil,board,pos)
        super
    end

    def move_dirs
        @@ADJACENT + @@DIAGONAL
    end
end