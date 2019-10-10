class Bishop < Piece

  

  def valid_move?(x_des, y_des)
    
    if x_des.to_i < 0 || x_des.to_i > 7
        
      return false
    else y_des.to_i < 0 || y_des.to_i > 7
      return false
    end

    x_diff = (x_position - x_des.to_i).abs
    x_diff != 0
    y_diff = (y_position - y_des.to_i).abs
    y_diff != 0

  end

end