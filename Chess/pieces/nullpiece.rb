require 'singleton'
class NullPiece < Piece
  include Singleton

  def initialize
  end
  
  def inspect
    p "NullPiece"
    # p color
  end

  def empty?
    true
  end

end