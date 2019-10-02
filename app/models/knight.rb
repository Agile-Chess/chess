class Knight < Piece

	  def html_code(color)
  	return (color == Piece::WHITE) ? '&#9816;' : '&#9822;'
  end


end