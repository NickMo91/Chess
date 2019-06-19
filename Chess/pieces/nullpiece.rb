require "singleton"
require_relative "piece"
require 'colorize'

class NullPiece < Piece
  include Singleton
  def initialize
    @symbol = "Null"
  end

  def to_s
    " "
  end

  def moves
  end

  def symbol
  end

end