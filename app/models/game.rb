class Game < ApplicationRecord
  has_many :pieces
  has_many :users
  scope :available, -> { where(black_player_id: nil) }
  scope :available, -> { where(white_player_id: nil) }

  BOARD_SIZE = 8
  

  
end