class Piece < ApplicationRecord
  belongs_to :game

  WHITE = 0
  BLACK = 1

  def html_code(color)
  	nil
  end
end
