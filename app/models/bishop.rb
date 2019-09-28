class Bishop < Piece

  def html_code
  	return y_position > 6 ? '&#9815;' : '&#9821;'
  end

end