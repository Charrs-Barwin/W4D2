require_relative "piece"

class Rook < Piece
    include Slideable

    def initialize(color=nil,board,pos)
        super
    end

    def move_dirs
        @@ADJACENT
    end
end