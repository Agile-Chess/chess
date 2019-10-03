class Game < ApplicationRecord
  after_create :populate_game
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


  def populate_game
    return false if white_player_id.nil? || black_player_id.nil?

    # White Pieces
    (0..7).each do |i|
      Pawn.create(
        game_id: id,
        x_position: i,
        y_position: 1,
        player_id: white_player_id,
        color: Piece::WHITE
        )
    end

    Rook.create(game_id: id, player_id: white_player_id, x_position: 0, y_position: 0, color: Piece::WHITE)
    Rook.create(game_id: id, player_id: white_player_id, x_position: 7, y_position: 0, color: Piece::WHITE)

    Knight.create(game_id: id, player_id: white_player_id, x_position: 1, y_position: 0, color: Piece::WHITE)
    Knight.create(game_id: id, player_id: white_player_id, x_position: 6, y_position: 0, color: Piece::WHITE)

    Bishop.create(game_id: id, player_id: white_player_id, x_position: 2, y_position: 0, color: Piece::WHITE)
    Bishop.create(game_id: id, player_id: white_player_id, x_position: 5, y_position: 0, color: Piece::WHITE)

    Queen.create(game_id: id, player_id: white_player_id, x_position: 3, y_position: 0, color: Piece::WHITE)
    King.create(game_id: id, player_id: white_player_id, x_position: 4, y_position: 0, color: Piece::WHITE)

    # Black Pieces
    (0..7).each do |i|
      Pawn.create(
        game_id: id,
        x_position: i,
        y_position: 6,
        player_id: black_player_id,
        color: Piece::BLACK
        )
    end

    Rook.create(game_id: id, player_id: black_player_id, x_position: 0, y_position: 7, color: Piece::BLACK)
    Rook.create(game_id: id, player_id: black_player_id, x_position: 7, y_position: 7, color: Piece::BLACK)

    Knight.create(game_id: id, player_id: black_player_id, x_position: 1, y_position: 7, color: Piece::BLACK)
    Knight.create(game_id: id, player_id: black_player_id, x_position: 6, y_position: 7, color: Piece::BLACK)

    Bishop.create(game_id: id, player_id: black_player_id, x_position: 2, y_position: 7, color: Piece::BLACK)
    Bishop.create(game_id: id, player_id: black_player_id, x_position: 5, y_position: 7, color: Piece::BLACK)

    Queen.create(game_id: id, player_id: black_player_id, x_position: 3, y_position: 7, color: Piece::BLACK)
    King.create(game_id: id, player_id: black_player_id, x_position: 4, y_position: 7, color: Piece::BLACK)

    return true
  end

end
