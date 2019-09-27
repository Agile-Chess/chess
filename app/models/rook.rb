class Rook < Piece

	  def html_code
  	return y_coord > 6 ? '&#9814;' : '&#9820;'
  end
end