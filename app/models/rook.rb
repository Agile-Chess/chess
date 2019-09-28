class Rook < Piece

	  def html_code
  	return y_position >= 6 ? '&#9814;' : '&#9820;'
  end
end