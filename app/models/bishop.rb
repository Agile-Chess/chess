class Bishop < Piece

  

  def valid_move?(x_des, y_des)
    if x_des < 0 || x_des > 7
      return false
    else y_des < 0 || y_des > 7
      return false
    end
    x_diff = (x_position - x_des).abs
    x_diff != 0
    y_diff = (y_position - y_des).abs
    y_diff != 0
  end

end