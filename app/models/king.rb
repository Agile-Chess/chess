class King < Piece


<<<<<<< HEAD

=======
  def html_code(color)
    return (color == Piece::WHITE) ? '&#9812;' : '&#9818;'
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
  
>>>>>>> 5567b055dbbeff4734e2cb16d9e1ff25da3f9ace
end