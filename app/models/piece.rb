class Piece < ApplicationRecord
  belongs_to :games

  def is_obstructed?(x_des, y_des)
    pieces_in_row = game.pieces.where(x_pos: x_des)
    pieces_in_column = game.pieces.where(y_pos: y_des)
    # horizontal case
    if move_type(x_des, y_des) == :horizontal
      !pieces_in_column.where("x_pos > ? AND x_pos < ?", [self.x_pos, x_des].min, [self.x_pos, x_des].max).empty?
    # vertical case
    elsif move_type(x_des, y_des) == :vertical
      !pieces_in_row.where("y_pos > ? AND y_pos < ?", [self.y_pos, y_des].min, [self.y_pos, y_des].max).empty?
    # diagonal case
    elsif move_type(x_des, y_des) == :diagonal
      diagonal_blocker?(x_des, y_des)
    else
      raise "Invalid move" if move_type(x_des, y_des) == :invalid
    end
  end




end
