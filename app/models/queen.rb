class Queen < Piece

	  def html_code
  	return y_coord > 6 ? '&#9813;' : '&#9819;'
  end
end