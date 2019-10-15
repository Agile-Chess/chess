class Game < ApplicationRecord
  has_many :pieces
  has_many :users

  before_create :draw_board!
  after_create :assign_pieces
  BOARD_SIZE = 8

  scope :available_black, -> { where(black_player_id: nil) }
  scope :available_white, -> { where(white_player_id: nil) }



  def draw_board!
    #Draw White Pawns
    (1..8).each do |x_position|
      Pawn.create(game_id: id,  x_position: x_position, y_position: 7, color: 0, html_code: "&#9817;")
    end
    #Draw White Rooks
    [1,8].each do |x_position|
      Rook.create(game_id: id, x_position: x_position, y_position: 8, color: 0, html_code: "&#9814;")
    end
    #Draw White Knights
    [2,7].each do |x_position|
      Knight.create(game_id: id, x_position: x_position, y_position: 8, color: 0, html_code: "&#9816;")
    end
    #Draw White Bishops
    [3,6].each do |x_position|
      Bishop.create(game_id: id, x_position: x_position, y_position: 8, color: 0, html_code: "&#9815;")
    end
    #Draw White King
    King.create(game_id: id, x_position: 4, y_position: 8, color: 0, html_code: "&#9812;")
    #Draw White Queen
    Queen.create(game_id: id, x_position: 5, y_position: 8, color: 0, html_code: "&#9813;")
#Draw Black Pieces
 #Draw Black Pawns
 (1..8).each do |x_position|
  Pawn.create(game_id: id, x_position: x_position, y_position: 2, html_code: "&#9823;", color: 1)
end
    #Draw Black Rooks
    [1,8].each do |x_position|
      Rook.create(game_id: id, x_position: x_position, y_position: 1, html_code: "&#9820;", color: 1)
    end
    #Draw Black Knights
    [2,7].each do |x_position|
      Knight.create(game_id: id, x_position: x_position, y_position: 1, html_code: "&#9822;", color: 1)
    end
    #Draw Black Bishops
    [3,6].each do |x_position|
      Bishop.create(game_id: id, x_position: x_position, y_position: 1, html_code: "&#9821;", color: 1)
    end
    #Draw Black King
    King.create(game_id: id, x_position: 4, y_position: 1, html_code: "&#9818", color: 1)
    #Draw Black Queen
    Queen.create(game_id: id, x_position: 5, y_position: 1, html_code: "&#9819;", color: 1)



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

  def assign_pieces
    pieces.where(color: 0).each do |p|
      p.update_attributes(player_id: white_player_id)
    end
    pieces.where(color: 1).each do |p|
      p.update_attributes(player_id: black_player_id)
    end
  end  


  def available_black?
    return black_player_id.nil?
  end

  def available_white?
    return white_player_id.nil?
  end
  
  def forfeit(current_user_id)
    if current_user_id == white_player_id
      update_attributes(winning_player_id: black_player_id, state: 'forfeit')
    else
      update_attributes(winning_player_id: white_player_id, state: 'forfeit')
    end
  end
end