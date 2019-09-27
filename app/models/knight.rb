class Knight < Piece

	  def html_code
  	return y_coord > 6 ? '&#9816;' : '&#9822;'
  end
end