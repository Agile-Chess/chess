class Piece < ApplicationRecord
  MIN_BOARD_SIZE = 0
  MAX_BOARD_SIZE = 7

  belongs_to :game
  belongs_to :user

  # determine if user of piece matches current turn
  def user_owns_piece?
    player_id == game.turn
  end

  # determine that piece moved
  # a piece has to move each turn
  def nil_move?(x, y)
    x_position == x && y_position == y
  end

  # determine that move stays on the board
  def move_on_board?(x, y)
    (x <= MAX_BOARD_SIZE && x >= MIN_BOARD_SIZE) && 
    (y <= MAX_BOARD_SIZE && y <= MIN_BOARD_SIZE)  
  end

  # determine that obstructing piece not yours
  # determine that captured piece player_id not yours
  # placeholder for process 'obstruction'
  # using piece owner player_id rather than piece color to validate different owners of pieces
  def capture_move?(x, y)
    captured_piece = game.obstruction(x, y)
    captured_piece && captured_piece.player_id != player_id
  end

  # placeholder - destination_obstruction your piece
  def destination_obstruction?(x, y)
    return false unless captured_move?(x, y)
  end

  # placeholder - obstructed_move blocks move
  def obstructed_move?(x, y)
    true
  end



  # determine that move is valid
  # define legal_move via models/king.rb
  # how to related king.rb test results on piece.rb?
  def valid_move?(x, y)
    return false unless user_owns_piece?
    return false if nil_move?(x, y)
    return false unless move_on_board?(x, y)
    return false unless legal_move(x, y)
    return false if obstructed_move?(x, y)
    return false if destination_obstructed?(x, y)
    true
  end

end
