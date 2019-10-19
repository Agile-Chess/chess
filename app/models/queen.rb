# frozen_string_literal: true
# define valid move for Queen
class Queen < Piece
  def valid_move?(x_des, y_des)
    move_type(x_des, y_des) == 'horizontal' || 'vertical' || 'diagonal'
  end
end
