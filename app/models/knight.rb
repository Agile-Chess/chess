class Knight < Piece

	  def html_code(color)
  	return (color == Piece::WHITE) ? '&#9816;' : '&#9822;'
  end

  def valid_move?(x,y)

  	x_position = x_position(x)
  	y_position = y_position(y)

  	(x_position == 1 && y_position == 2) || (x_position == 2 && y_position == 1)

  end
end