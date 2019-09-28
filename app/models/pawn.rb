class Pawn < Piece

	  def html_code
  	return y_position >= 6 ? '&#9817;' : '&#9823;'
  end
end