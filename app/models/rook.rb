class Rook < Piece

  def html_code
    return y_position > 5  ? '&#9814;' : '&#9820;'
  end

  def legal_move?(x, y)
    if x<0 or x>7
      return false
    end
    is_moving_horizontal = horizontal_move x
    is_moving_veritical = veritcal_move y
    return is_moving_horizontal ^ is_moving_vertical
  end

  private

  def horizontal_move?(x)
    x_diff = (x_position - x).abs
    x_diff != 0
  end

  def vertical_move?(y)
    y_diff = (y_position - y).abs
    y_diff != 0
  end

end