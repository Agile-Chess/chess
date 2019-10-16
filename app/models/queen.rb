class Queen < Piece

  def valid_move?(x_des, y_des)
    return false if !move_on_board?(x_des, y_des)
    (x_position == x_des || y_position == y_des || x_diff(x_des) == y_diff(y_des))
  end

end