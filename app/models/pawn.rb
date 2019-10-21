# frozen_string_literal: true

# define valid moves for pawn
class Pawn < Piece

  # has piece been previously moved
  def first_move_pawn?
    # check if white pawn moved from row 1 or black from row 7
    y_position == 7 && color == 0 || y_position == 2 && color == 1
  end

  # ensure no forward obstruction
  def no_forward_obstruction?(x_des, y_des)
    pieces_in_row = game.pieces.where(x_position: x_des)
    pieces_in_column = game.pieces.where(y_position: y_des)   
    move_type(x_des, y_des) == 'vertical' &&
      pieces_in_column.where('y_position > ? AND y_position < ?',
                            [self.y_position, y_des.to_i].min,
                            [self.y_position, y_des.to_i].max).empty?
  end
 
  # verify no x move except in capture
  def no_x_move?(x_des)
    (x_des.to_i - x_position) == 0
  end

  # can pawn move 2 squares forward or obstructed
  def move_forward_two?(x_des, y_des)
    # Set forward direction based on piece color
    if y_position == 7
      direction = 1
    elsif y_position == 2
      direction = -1
    end

    # Subtract y_des and y_position, and check equality to 2 or -2 based on direction
    y_position - y_des.to_i == 2 * direction  && no_forward_obstruction?(x_des, y_des)
  end

  # allowed base move for pawn
  def standard_move?(x_des, y_des)
    y_chg = (y_des.to_i - y_position).abs
    x_chg = (x_des.to_i - x_position).abs
    x_chg == 0 && ( y_chg == 1 ||
      ( first_move_pawn? && move_forward_two?(x_des, y_des) ) )
  end

  # capture move for pawn
  def pawn_capture_move?(x_des, y_des)
    y_chg = (y_des.to_i - y_position).abs
    x_chg = (x_des.to_i - x_position).abs
    move_type(x_des, y_des) == 'diagonal' && (x_chg && y_chg == 1)
  end

  def en_passant_available?(y_des)
    y_chg = (y_des - y_position)
    first_move_pawn? && y_chg > 0 && y_chg < 3 && move_forward_two?
  end

  def en_passant_capture?(x_des, y_des)
    y_chg = (y_des - y_position).abs
    x_chg = (x_des - x_position).abs
    (move_type(x_des, y_des) == 'diagonal' && y_chg == 1 && pawn_capture_move? ) ||
      ( en_passant_available? && pawn_capture_move? )
  end

  # placeholder for promotion move option
  def promotion_move?(_x_des, _y_des)
    false
  end

  # test for valid move of piece
  def valid_move?(x_des, y_des)
    ( no_x_move?(x_des) && standard_move?(x_des, y_des) ) ||
      ( promotion_move?(x_des, y_des) || pawn_capture_move?(x_des, y_des) )
  end
end
