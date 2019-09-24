class Pawn < Piece

	  def html_code(color)
  	return (color == Piece::WHITE) ? '&#9817;' : '&#9823;'
  end
end