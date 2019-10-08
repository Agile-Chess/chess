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
      Pawn.create(game_id: id,  x_position: x_position, y_position: 7, html_code: "&#9817;")
    end
    #Draw White Rooks
    [1,8].each do |x_position|
      Rook.create(game_id: id, x_position: x_position, y_position: 8, html_code: "&#9814;")
    end
    #Draw White Knights
    [2,7].each do |x_position|
      Knight.create(game_id: id, x_position: x_position, y_position: 8, html_code: "&#9816;")
    end
    #Draw White Bishops
    [3,6].each do |x_position|
      Bishop.create(game_id: id, x_position: x_position, y_position: 8, html_code: "&#9815;")
    end
    #Draw White King
    King.create(game_id: id, x_position: 4, y_position: 8, html_code: "&#9812;")
    #Draw White Queen
    Queen.create(game_id: id, x_position: 5, y_position: 8, html_code: "&#9813;")
#Draw Black Pieces
 #Draw Black Pawns
 (1..8).each do |x_position|
  Pawn.create(game_id: id, x_position: x_position, y_position: 2, html_code: "&#9823;")
end
    #Draw Black Rooks
    [1,8].each do |x_position|
      Rook.create(game_id: id, x_position: x_position, y_position: 1, html_code: "&#9820;")
    end
    #Draw Black Knights
    [2,7].each do |x_position|
      Knight.create(game_id: id, x_position: x_position, y_position: 1, html_code: "&#9822;")
    end
    #Draw Black Bishops
    [3,6].each do |x_position|
      Bishop.create(game_id: id, x_position: x_position, y_position: 1, html_code: "&#9821;")
    end
    #Draw Black King
    King.create(game_id: id, x_position: 4, y_position: 1, html_code: "&#9818")
    #Draw Black Queen
    Queen.create(game_id: id, x_position: 5, y_position: 1, html_code: "&#9819;")



  end

  def tile_color(x,y)
    if y.odd? && x.odd?
      "black"
    elsif y.odd? && x.even?
      "white"
    elsif y.even? && x.odd?
      "white"
    elsif y.even? && x.even?
      "black"
    end
    
  end

  


  def available_black?
    return black_player_id.nil?
  end

  def available_white?
    return white_player_id.nil?
  end
  
end