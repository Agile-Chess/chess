class King < Piece

	  def html_code(color)
  	return (color == Piece::WHITE) ? '&#9812;' : '&#9818;'
  end

end