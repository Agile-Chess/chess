class Queen < Piece

  def html_code(color)
  	return (color == Piece::WHITE) ? '&#9813;' : '&#9819;'
  end

  def valid_move?(x_des, y_des)
    return false if !within_bounds?(x_des, y_des)
    (x_pos == x_des || y_pos == y_des || x_diff(x_des) == y_diff(y_des))
  end



end