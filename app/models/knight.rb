# frozen_string_literal: true

# define valid move for Knight
class Knight < Piece
  def valid_move?(new_x_coord, new_y_coord)
    x_dif = (x_position - new_x_coord.to_i).abs
    y_dif = (y_position - new_y_coord.to_i).abs
    if ((x_dif == 1 && y_dif == 2) || (x_dif == 2 && y_dif == 1))
      return true
    end
  end
end
