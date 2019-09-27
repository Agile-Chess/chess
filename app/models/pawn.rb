class Pawn < Piece

	  def html_code
  	return y_coord > 6 ? '&#9817;' : '&#9823;'
  end
end