class Bishop < Piece

  def html_code(color)
  	return (color == Piece::WHITE) ? '&#9815;' : '&#9821;'
  end

  def valid_move?(x_des, y_des)
    if x_des < -7 && > 7
      return false
    elsif y_des < -7 && > 7
      return false
    end
    x_diff = (x_position - x_des).abs
    x_diff != 0
    y_diff = (y_position - y_des).abs
    y_diff != 0
  end
  
end