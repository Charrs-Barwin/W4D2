require_relative "piece"

class Bishop < Piece
    include Slideable
    
    def initialize(color=nil,board,pos)
        super
    end

    def move_dirs
        @@DIAGONAL
    end
end