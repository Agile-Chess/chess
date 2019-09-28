class Queen < Piece

	  def html_code
  	return y_position > 6 ? '&#9813;' : '&#9819;'
  end
end