class King < Piece

  
  
  # allowed base move for king 
  def standard_move?(x, y)
    x_chg = (x - x_position).abs
    y_chg = (y - y_position).abs

    (x_chg <= 1) && (y_chg <= 1)
  end
  
  # Returns true if the king and rook are not moved
  # location is valid and no obstruction
  def castling_move?(x, y)
     return false unless castling_coordinates?([x, y])
    return false if moved
    rook = castling_rook(x)
    return false unless rook
    distance = x_distance(rook.x_position)
    if path_clear?(rook.x_position, rook.y_position, distance) & !rook.moved
      rook.castling_move
      return true
    end
    false
  end

  
    def castling_coordinates?(coordinates)
    options = if color == 'white'
                [[6, 7], [2, 7]]
              else
                [[6, 0], [2, 0]]
              end
    options.include?(coordinates)
  end

    def castling_rook(x)
    rook_x = x == 6 ? 7 : 0
    rook_y = color == 'white' ? 7 : 0
    game.pieces.find_by(x_position: rook_x, y_position: rook_y)
  end
end

  # either standard_move or castling_move 
  # must be true for move to be legal
  def valid_move?(x, y)
    standard_move?(x, y) || castling_move?(x, y)
  end