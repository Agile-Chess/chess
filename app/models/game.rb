class Game < ApplicationRecord
  has_many :pieces
  #has_many :users
  #this relationship is incorrect
  BOARD_SIZE = 8
  scope :available, -> { where(black_player_id: nil) }
  scope :available, -> { where(white_player_id: nil) }
end