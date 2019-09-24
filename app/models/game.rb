class Game < ApplicationRecord
  has_many :pieces
  has_many :users
  BOARD_SIZE = 8
  
  scope :available_black, -> { where(black_player_id: nil) }
  scope :available_white, -> { where(white_player_id: nil) }

  def available_black?
    return black_player_id.nil?
  end

  def available_white?
    return white_player_id.nil?
  end
  
end

