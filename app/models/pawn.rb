class Pawn < Piece
  # sets pieces image
  def html_code
    return y_position > 6 ? '&#9817;' : '&#9823;'
  end

  # has piece been previously moved
  def first_move_pawn?
    # check if white pawn moved from row 1
    if y_position == 1 && color == Piece::WHITE ||
       # check if black pawn moved from row 6
       y_position == 6 && color == Piece::BLACK
    end
  end

  # ensure no forward obstruction
  def no_forward_obstruction?(x_des, y_des)
    if move_type(x_des, y_des) == :vertical &&
       !pieces_in_column.where('y_position > ? AND y_position < ?',
                               [y_position, y_des].min,
                               [y_position, y_des].max).empty?
    end
  end

  # can pawn move 2 squares forward or obstructed
  def move_forward_white?(x_des, _y_des)
    # check if white pawn is in pos 1 and no obstruction
    if y_position == 1 && color == Piece::WHITE &&
       move_type(x_des, 3) == :vertical &&
       !pieces_in_column.where('1 > ? AND 1 < ?',
                               [y_position, 3].min,
                               [y_position, 3].max).empty?
    end
  end

  # check if white pawn is in pos 1 and no obstruction
  def move_forward_black?(x_des, _y_des)
    # check if black pawn is in pos 1 and no obstruction
    if y_position == 6 && color == Piece::BLACK &&
       move_type(x_des, 4) == :vertical &&
       !pieces_in_column.where('6 > ? AND 6 < ?',
                               [y_position, 4].min,
                               [y_position, 4].max).empty?
    end
  end

  # verify no x move except in capture
  def no_x_move?(x_des)
    if (pawn_capture_move false) && (x_des - x_position).zero?
    end
  end

  # can pawn move 2 squares forward or obstructed
  def move_forward_two?(*)
    if (move_forward_white true) ||
       (move_forward_black true)
      true
    end
  end

  # allowed base move for pawn
  def standard_move?(x_des, y_des)
    y_chg = (y_des - y_position)
    x_chg = (x_des - x_position)
    if (first_move_pawn true) && (y_chg.positive && y_chg < 3) &&
       (move_forward_two? true)
    else
      y_chg == 1 && x_chg.zero?
    end
  end

  # capture move for pawn
  def pawn_capture_move?(x_des, y_des)
    y_chg = (y_des - y_position).abs
    x_chg = (x_des - x_position).abs
    if move_type(x_des, y_des) == :diagonal &&
       (x_chg && y_chg == 1) &&
       (captured_move? true)
    end
  end

  # placeholder for promotion move option
  def promotion_move?(_x_des, _y_des)
    false
  end

  # test for valid move of piece
  def valid_move?(*)
    if (no_forward_obstruction? true) &&
       (no_x_move? true) &&
       (standard_move? true) ||
       (promotion_move? true) ||
       (pawn_capture_move? true)
      true
    end
  end
end

