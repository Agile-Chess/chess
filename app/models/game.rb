class Game < ApplicationRecord
  has_many :pieces
  #has_many :users
  #this relationship is incorrect
  BOARD_SIZE = 8
end

  

