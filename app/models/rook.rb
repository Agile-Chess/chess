class Rook < Piece

	  def html_code(color)
  	return (color == Piece::WHITE) ? '&#9814;' : '&#9820;'
  end
end