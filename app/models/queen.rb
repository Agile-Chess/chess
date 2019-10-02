class Queen < Piece

	  def html_code(color)
  	return (color == Piece::WHITE) ? '&#9813;' : '&#9819;'
  end

end