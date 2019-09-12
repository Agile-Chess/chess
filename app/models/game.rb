class Game < ApplicationRecord
  has_many :pieces
  has_many :users

  BOARD_SIZE = 8
  

  
end
