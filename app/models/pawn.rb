# frozen_string_literal: true

# define pawn specific attributes
class Pawn < Piece
  # sets pieces image
  def html_code(color)
    color == Piece::WHITE ? '&#9817;' : '&#9823;'
  end

  # has piece been previously moved
  def first_move_pawn?
    # check if white pawn moved from row 1
    if y_position == 1 && color == Piece::WHITE ||
    # check if black pawn moved from row 6
       y_position == 6 && color == Piece::BLACK
    end
  end

  # allowed base move for pawn
  def standard_move?(x_des, y_des)
    y_chg = (y_des - y_position)
    x_chg = (x_des - x_position)
    if first_move_pawn true && y_chg == 1 || 2 && x_chg.zero?
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
    if (standard_move? true) ||
       (promotion_move? true) ||
       (pawn_capture_move? true)
      true
    end
  end
end
