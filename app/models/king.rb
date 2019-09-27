class King < Piece


  def html_code
    return y_coord > 6 ? '&#9812;' : '&#9818;'
  end

  
  # allowed base move for king 
  def standard_move?(x, y)
    x_chg = (x - x_position).abs
    y_chg = (y - y_position).abs

    (x_chg <= 1) && (y_chg <= 1)
  end
  
  # placeholder for castling move option
  def castling_move?(x, y)
    false
  end

  # either standard_move or castling_move 
  # must be true for move to be legal
  def valid_move?(x, y)
    standard_move?(x, y) || castling_move?(x, y)
  end
  
end