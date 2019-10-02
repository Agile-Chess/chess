class Bishop < Piece

  def html_code(color)
  	return (color == Piece::WHITE) ? '&#9815;' : '&#9821;'
  end


end