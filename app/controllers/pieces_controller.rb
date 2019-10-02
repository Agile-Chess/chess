class PiecesController < ApplicationController
before_action :find_piece,:verify_two_players, :verify_player_turn, :verify_valid_move

def show
  @piece = Piece.find(params[:id])
  @game = @piece.game
  render "games/show"
end

def update
    @piece = Piece.find(params[:id])
    @game = @piece.game

    if !your_turn?
      render text: 'It must be your turn',
             status: :unauthorized
    else
      @piece.attempt_move(piece_params)
      @piece.save 
      redirect_to game_path @game
    end
  end

  private

  def piece_params
    @piece_params = params.require(:piece).permit(
      :x_position,
      :y_position,
      :type)
  end
end
