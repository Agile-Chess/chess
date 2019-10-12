# frozen_string_literal: true

class Piece < ApplicationRecord
  MIN_BOARD_SIZE = 1
  MAX_BOARD_SIZE = 8
  WHITE = 0
  BLACK = 1

  belongs_to :game
  # belongs_to :user

  def move_type(x_des, y_des)
    if (x_position - x_des).abs.positive? && (y_position - y_des).abs.zero
      'horizontal'
    elsif (x_position - x_des).abs.zero && (y_position - y_des).abs.positive?
      'vertical'
    elsif (x_position - x_des).abs.positive? && (y_position - y_des).abs.positive?
      'diagonal'
    else
      'invalid'
    end
  end

  def obstructed?(x_des, y_des)
    pieces_in_row = game.pieces.where(x_position: x_des)
    pieces_in_column = game.pieces.where(y_position: y_des)
    # horizontal case
    if move_type(x_des, y_des) == 'horizontal'
      !pieces_in_row.where('x_position > ? AND x_position < ?',
                           [x_position, x_des].min, [x_position, x_des].max).empty?
    # vertical case
    elsif move_type(x_des, y_des) == 'vertical'
      !pieces_in_column.where('y_position > ? AND y_position < ?',
                              [y_position, y_des].min, [y_position, y_des].max).empty?
    # diagonal case
    elsif move_type(x_des, y_des) == 'diagonal'
      diagonal_blocker?(x_des, y_des)
    else
      raise 'Invalid'
    end
  end

  # determine if user of piece matches current turn
  def user_owns_piece?
    player_id == game.turn
  end

  # determine that piece moved
  # a piece has to move each turn
  def nil_move?(x_des, y_des)
    x_position == x_des && y_position == y_des
  end

  # determine that move stays on the board
  def move_on_board?(x_des, y_des)
    (x_des <= MAX_BOARD_SIZE && x_des >= MIN_BOARD_SIZE) &&
      (y_des <= MAX_BOARD_SIZE && y_des <= MIN_BOARD_SIZE)
  end

  def move_to!(new_x, new_y)
    if destination_obstruction?(new_x, new_y)
      captured_piece = game.obstruction(new_x, new_y)
      captured_piece.update_attributes(x_position: nil, y_position: nil)
    end
    update_attributes(x_position: new_x, y_position: new_y, moved: true)
  end

  # determine that obstructing piece not yours
  # determine that captured piece player_id not yours
  # placeholder for process 'obstruction'
  # using piece owner player_id rather than piece color to validate different owners of pieces
  def captured_move?(_x_des, _y_des)
    # captured_piece = game.obstruction(x_des, y_des)
    # captured_piece && captured_piece.player_id != player_id
    false
  end

  # placeholder - destination_obstruction your piece
  def destination_obstruction?(x_des, y_des)
    return false unless captured_move?(x_des, y_des)
  end

  # determine that move is valid
  # define legal_move via models/king.rb
  # how to related king.rb test results on piece.rb?
  def valid_move?(x_des, y_des)
    return false unless user_owns_piece?
    return false if nil_move?(x_des, y_des)
    return false unless move_on_board?(x_des, y_des)
    return false if obstructed?(x_des, y_des)
    return false if destination_obstructed?(x_des, y_des)

    true
  end
end
