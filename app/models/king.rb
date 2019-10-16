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
    # Have pieces moved before?
    if has_moved
      return false
    end
    x_chg = (x - x_position).abs
    y_chg = (y - y_position).abs
    if y_chg != 0 or x_chg != 2 
      return false
    end
    #which rook
    if (x - x_position) > 0 
      rook_x = 0
    else
      roox_x = 7
    end
    #query to pull down rook
    rook = Piece.find_by(game_id: game_id, x_position: rook_x, y_position: y_position, type: "rook")
    if not rook.present?
      return false
    end
    if rook.has_moved
      return false
    end
    # Is the path obstructed?
    (([rook_x, x_position].min + 1)..([x_position, rook_x].max - 1)).each do |n|   
     checked_piece = Piece.find_by(game_id: game_id, x_position: n, y_position: y_position)
    if checked_piece.present?
      return false
    end
    end
    return true
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