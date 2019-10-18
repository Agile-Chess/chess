# frozen_string_literal: true

# define valid move for Bishop
class Bishop < Piece

  def valid_move?(x_des, y_des)
    move_type(x_des, y_des) == diagonal ? true : false
  end


end