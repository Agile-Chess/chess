class Game < ApplicationRecord
  has_many :pieces
  has_many :users

  after_create :draw_board!
  BOARD_SIZE = 8
  
  scope :available_black, -> { where(black_player_id: nil) }
  scope :available_white, -> { where(white_player_id: nil) }

  def draw_board!
    #Draw White Pawns
    (1..8).each do |x_position|
      Pawn.create(game_id: id,  x_position: x_position, y_position: 7)
    end
    #Draw White Rooks
    [1,8].each do |x_position|
      Rook.create(game_id: id, x_position: x_position, y_position: 8)
    end
    #Draw White Knights
    [2,7].each do |x_position|
      Knight.create(game_id: id, x_position: x_position, y_position: 8)
    end
    #Draw White Bishops
    [3,6].each do |x_position|
      Bishop.create(game_id: id, x_position: x_position, y_position: 8)
    end
    #Draw White King
    King.create(game_id: id, x_position: 4, y_position: 8)
    #Draw White Queen
    Queen.create(game_id: id, x_position: 5, y_position: 8)
#Draw Black Pieces
 #Draw Black Pawns
 (1..8).each do |x_position|
  Pawn.create(game_id: id, x_position: x_position, y_position: 2)
end
    #Draw Black Rooks
    [1,8].each do |x_position|
      Rook.create(game_id: id, x_position: x_position, y_position: 1)
    end
    #Draw Black Knights
    [2,7].each do |x_position|
      Knight.create(game_id: id, x_position: x_position, y_position: 1)
    end
    #Draw Black Bishops
    [3,6].each do |x_position|
      Bishop.create(game_id: id, x_position: x_position, y_position: 1)
    end
    #Draw Black King
    King.create(game_id: id, x_position: 4, y_position: 1)
    #Draw Black Queen
    Queen.create(game_id: id, x_position: 5, y_position: 1)



  end

  def tile_color(x,y)
    if y.odd? && x.odd?
      "black droppable"
    elsif y.odd? && x.even?
      "white droppable"
    elsif y.even? && x.odd?
      "white droppable"
    elsif y.even? && x.even?
      "black droppable"
    end
    
  end

  


  def available_black?
    return black_player_id.nil?
  end

  def available_white?
    return white_player_id.nil?
  end
  
end

