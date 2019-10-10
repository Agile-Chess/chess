class King < Piece

  
  
  # allowed base move for king 
  def standard_move?(x, y)
    x_chg = (x - x_position).abs
    y_chg = (y - y_position).abs

    (x_chg <= 1) && (y_chg <= 1)
  end
  
  # placeholder for castling move option
  def castling_move?(x, y)
    false
    #write code for 
  end

  # either standard_move or castling_move 
  # must be true for move to be legal
  def valid_move?(x, y)
    standard_move?(x, y) || castling_move?(x, y)
  end

  def attempt_move(piece_params)
    #update has_moved to true done in piece.rb line 14 "has_moved: true"
  ##if regular move, then do normal update
  ##if castling move, move king then move correct rook to correct location.
  end
end  