class King < Piece

  
  
  # allowed base move for king 
  def standard_move?(x, y)
    x_chg = (x - x_position).abs
    y_chg = (y - y_position).abs

    (x_chg <= 1) && (y_chg <= 1)
  end
  
  # Returns true if the king and rook are not moved
  # location is valid and no obstruction
  def can_castle?(x, y)
    return false if moved
     return false unless castling_coordinates?([x, y])
    rook = castling_rook(x)
    return false unless rook
    return false if rook.moved
    return false unless castle_path_clear?(rook)
    return true
  end

  def castle_path_clear?(rook)
    if rook.x_position == 0
      (1...self.x_position).each do |x|
       return false if game.pieces.find_by(x_position: x, y_position: rook.y)
      end
    else 
      ((self.x_position + 1)...7).each do |x|
        return false if game.pieces.find_by(x_position: x, y_position: rook.y)
      end
    end
    return true
  end

  def castle!(x, y)
    rook = castling_rook(x)
    update_attributes(x_position: x, y_position: y, moved: true)
    rook_x = (x == 2) ? 3 : 5
    rook.update_attributes(x_position: rook_x, y_position: y, moved: true)
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