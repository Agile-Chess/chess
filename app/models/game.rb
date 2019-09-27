class Game < ApplicationRecord
  has_many :pieces
  has_many :users

  after_create :draw_board!
  BOARD_SIZE = 8
  
  scope :available_black, -> { where(black_player_id: nil) }
  scope :available_white, -> { where(white_player_id: nil) }

  def draw_board!
    #Draw White Pawns
    (0...8).each do |x_coord|
      Pawn.create(game_id: id, white: true, x_coord: x_coord, y_coord: 7)
    end
    #Draw White Rooks
    [1,8].each do |x_coord|
      Rook.create(game_id: id, white: true, x_coord: x_coord, y_coord: 8)
    end
    #Draw White Knights
    [2,7].each do |x_coord|
      Knight.create(game_id: id, white: true, x_coord: x_coord, y_coord: 8)
    end
    #Draw White Bishops
    [3,6].each do |x_coord|
      Bishop.create(game_id: id, white: true, x_coord: x_coord, y_coord: 8)
    end
    #Draw White King
    King.create(game_id: id, white: true, x_coord: 4, y_coord: 8)
    #Draw White Queen
    Queen.create(game_id: id, white: true, x_coord: 5, y_coord: 8)
#Draw Black Pieces
 #Draw Black Pawns
    (0...8).each do |x_coord|
      Pawn.create(game_id: id, white: false, x_coord: x_coord, y_coord: 2)
    end
    #Draw Black Rooks
    [1,8].each do |x_coord|
      Rook.create(game_id: id, white: true, x_coord: x_coord, y_coord: 1)
    end
    #Draw Black Knights
    [2,7].each do |x_coord|
      Knight.create(game_id: id, white: true, x_coord: x_coord, y_coord: 1)
    end
    #Draw Black Bishops
    [3,6].each do |x_coord|
      Bishop.create(game_id: id, white: true, x_coord: x_coord, y_coord: 1)
    end
    #Draw Black King
    King.create(game_id: id, white: true, x_coord: 4, y_coord: 1)
    #Draw Black Queen
    Queen.create(game_id: id, white: true, x_coord: 5, y_coord: 1)



  end

  def available_black?
    return black_player_id.nil?
  end

  def available_white?
    return white_player_id.nil?
  end
  
end

