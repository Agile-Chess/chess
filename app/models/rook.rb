class Rook < Piece

  def valid_move?(x_des, y_des)
    move_type == horizontal || vertical
  end

  # def valid_move?(x, y)
  #   is_moving_horizontal = horizontal_move? x
  #   is_moving_veritical = veritcal_move? y
  #   return is_moving_horizontal ^ is_moving_vertical
  # end

  # private

  # def horizontal_move?(x)
  #   x_diff = (x_position - x).abs
  #   x_diff != 0
  # end

  # def vertical_move?(y)
  #   y_diff = (y_position - y).abs
  #   y_diff != 0
  # end

end