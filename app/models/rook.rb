class Rook < Piece


  # def horizontal_move?(x_des)
  #   (x_position - x_des.to_i).abs != 0
  # end

  # def vertical_move?(y_des)
  #   (y_position - y_des.to_i).abs != 0
  # end

  def valid_move?(x_des, y_des)
    move_type(x_des, y_des) == 'horizontal' || 'vertical'
  end

end